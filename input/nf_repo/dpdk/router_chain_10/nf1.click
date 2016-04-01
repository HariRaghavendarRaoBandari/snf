define(
	$iface0         nf1vif0,
	$macAddr0       ec:f4:bb:d5:fe:08,
	$ipAddr0        10.0.0.1,
	$ipNetHost0     10.0.0.0/32,
	$ipBcast0       10.0.0.255/32,
	$ipNet0         10.0.0.0/24,
	$color0         1,
	
	$iface1         nf1vif1,
	$macAddr1       10:00:00:00:00:01,
	$ipAddr1        11.0.0.1,
	$ipNetHost1     11.0.0.0/32,
	$ipBcast1       11.0.0.255/32,
	$ipNet1         11.0.0.0/24,
	$color1         2,
	
	$gwMACAddr0     ec:f4:bb:d5:fe:d0,
	$gwMACAddr1     10:00:00:00:00:02,
	$gwPort         2,
	
	$queueSize      2000000,
	$mtuSize        9000,
	$ioMethod       LINUX,
	
	$burst          1,
	$txNdesc        2048,
	$rxNdesc        2048,
	
	$ioCore0        0,
	$ioCore1        0,
	$fwdProcCore    -1,
	$bwdProcCore    -1,
	
	$position       1,
	
	$fwd_lbIPAddr0  11.0.0.2,
	$fwd_lbIPAddr1  11.0.0.3,
	$bwd_lbIPAddr0  10.0.0.2,
	$bwd_lbIPAddr1  10.0.0.3,
	
	$reportFile     nf_rate.dat
);

/////////////////////////////////////////////////////////////////////////////
// Elements
elementclass Router {
	// Module's arguments
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwMACAddr0, $gwMACAddr1, $gwPort, $queueSize, $mtuSize,
	$burst, $ioMethod, $position, $reportFile |

	// Queues
	queue0 :: Queue($queueSize);
	queue1 :: Queue($queueSize);

	// Module's I/O
	in0  :: FromDevice($iface0, BURST $burst, SNAPLEN $mtuSize, PROMISC true, METHOD $ioMethod, SNIFFER false);
	out0 :: ToDevice  ($iface0, BURST $burst, METHOD $ioMethod);
	in1  :: FromDevice($iface1, BURST $burst, SNAPLEN $mtuSize, PROMISC true, METHOD $ioMethod, SNIFFER false);
	out1 :: ToDevice  ($iface1, BURST $burst, METHOD $ioMethod);

	// EtherEncap because we always send to one gw
	etherEncap0 :: EtherEncap(0x0800, $macAddr0, $gwMACAddr0);
	etherEncap1 :: EtherEncap(0x0800, $macAddr1, $gwMACAddr1);

	// Strip Ethernet header
	strip :: Strip(14);

	// Mark IP header (necessary after Strip)
	markIPHeader :: MarkIPHeader;

	// Routing table
	lookUp :: RadixIPLookup(
		$ipAddr0     0,
		$ipBcast0    0,
		$ipNetHost0  0,
		$ipAddr1     0,
		$ipBcast1    0,
		$ipNetHost1  0,
		$ipNet0      1,
		$ipNet1      2,
		0.0.0.0/0 $gwPort
	);

	// Process the IP options field (mandatory based on RFC 791)
	ipOpt0  :: IPGWOptions($ipAddr0);
	ipOpt1  :: IPGWOptions($ipAddr1);

	// Set source IP
	fixIP0  :: FixIPSrc($ipAddr0);
	fixIP1  :: FixIPSrc($ipAddr1);

	// Decrement IP TTL field
	decTTL0 :: DecIPTTL;
	decTTL1 :: DecIPTTL;

	// Fragment packets
	fragIP0 :: IPFragmenter($mtuSize);
	fragIP1 :: IPFragmenter($mtuSize);

	// Packet & Rate Counters
	counter_rx0 :: AverageCounter;
	counter_rx1 :: AverageCounter;
	counter_tx0 :: AverageCounter;
	counter_tx1 :: AverageCounter;

	/////////////////////////////////////////////////////////////////////
	// Interface's pipeline
	/////////////////////////////////////////////////////////////////////
	// Input --> Processing
	in0 -> counter_rx0 -> strip;
	in1 -> counter_rx1 -> strip;

	// --> Way out
	etherEncap0 -> counter_tx0 -> queue0 -> out0;
	etherEncap1 -> counter_tx1 -> queue1 -> out1;

	// Get IP address for routing
	strip
		-> markIPHeader
		-> GetIPAddress(16)
		-> [0]lookUp;

	// Packets for this machine (Never mind, it's a middlebox)
	lookUp[0]
		-> Discard;

	// Routed through local ifaces
	lookUp[1]
		-> DropBroadcasts
		-> ipOpt0[0]
		-> fixIP0
		-> decTTL0[0]
		-> fragIP0[0]
		//-> IPPrint(NF$position-Router-if0, TTL true, LENGTH true)
		-> [0]etherEncap0;

	lookUp[2]
		-> DropBroadcasts
		-> ipOpt1[0]
		-> fixIP1
		-> decTTL1[0]
		-> fragIP1[0]
		//-> IPPrint(NF$position-Router-if1, TTL true, LENGTH true)
		-> [0]etherEncap1;
	/////////////////////////////////////////////////////////////////////

	// Save useful counters
	DriverManager(
		wait,

		print >> $reportFile "In     Rate nf"$(position)": "$(counter_rx0.rate),
		print >> $reportFile "In  Counter nf"$(position)": "$(counter_rx0.count),
		print >> $reportFile "Out    Rate nf"$(position)": "$(counter_tx1.rate),
		print >> $reportFile "Out Counter nf"$(position)": "$(counter_tx1.count),
		print >> $reportFile "",

		wait 0.5s,
		stop
	);
}
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Scenario
/////////////////////////////////////////////////////////////////////////////
router :: Router(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwMACAddr0, $gwMACAddr1, $gwPort, $queueSize, $mtuSize,
	$burst, $ioMethod, $position, $reportFile
);
/////////////////////////////////////////////////////////////////////////////