/////////////////////////////////////////////////////////////////////////////
// Configuration
define(
	$iface0      em4,
	$macAddr0    ec:f4:bb:d5:fe:d5,
	$ipAddr0     100.0.0.1,
	$ipNetHost0  100.0.0.0/32,
	$ipBcast0    100.0.0.255/32,
	$ipNet0      100.0.0.0/24,
	$color0      1,

	$iface1      eth0,
	$macAddr1    00:60:6e:d5:8a:b8,
	$ipAddr1     200.0.0.1,
	$ipNetHost1  200.0.0.0/32,
	$ipBcast1    200.0.0.255/32,
	$ipNet1      200.0.0.0/24,
	$color1      2,

	$gwIPAddr    200.0.0.2,
	$gwMACAddr   00:00:00:00:00:04,
	$gwPort      2,

	$queueSize   1000000,
	$mtuSize     9000,
	$burst       8
);
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Elements
elementclass IPClassifierBench {
	// Module's arguments
	$iface0, $macAddr0,  $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1,  $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method |

	// Queues
	queue :: Queue($queueSize);

	// Module's I/O
	in  :: FromDevice($iface0, BURST $burst);
	out :: ToDevice  ($iface1, BURST $burst);
	
	// ARP Querier
	etherEncap :: EtherEncap(0x0800, $macAddr1, $gwMACAddr);

	// Strip Ethernet header
	strip :: Strip(14);

	// Check IP header's integrity
	markIPHeader :: MarkIPHeader;

	// Measure the incoming pkt rate
	getRate :: AverageCounter;

	/////////////////////////////////////////////////////////////////////
	// Interface's pipeline
	/////////////////////////////////////////////////////////////////////
	// Input
	in -> getRate -> strip;

	// Output
	Idle -> etherEncap -> queue -> out;

	
ipclassifier :: IPClassifier(
	((dst port 5312) || (dst port 13995) || (dst port 14015) || (dst port 25482) || (dst port 41260)) && ((dst net 8.0.0.0/20) || (dst net 8.0.16.0/22) || (dst net 8.0.20.0/25) || (dst net 8.0.20.128/26) || (dst net 8.0.20.192/27) || (dst net 8.0.20.224/29) || (dst net 8.0.20.232/30) || (dst net 8.0.20.237/32) || (dst net 8.0.20.238/31) || (dst net 8.0.20.240/28) || (dst net 8.0.21.0/24) || (dst net 8.0.22.0/23) || (dst net 8.0.24.0/27) || (dst net 8.0.24.32/28) || (dst net 8.0.24.48/30) || (dst net 8.0.24.53/32) || (dst net 8.0.24.54/31) || (dst net 8.0.24.56/29) || (dst net 8.0.24.64/26) || (dst net 8.0.24.128/25) || (dst net 8.0.25.0/24) || (dst net 8.0.26.0/23) || (dst net 8.0.28.0/22) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/22) || (dst net 8.0.180.0/24) || (dst net 8.0.181.0/26) || (dst net 8.0.181.64/27) || (dst net 8.0.181.96/28) || (dst net 8.0.181.112/29) || (dst net 8.0.181.120/30) || (dst net 8.0.181.124/32) || (dst net 8.0.181.126/31) || (dst net 8.0.181.128/25) || (dst net 8.0.182.0/23) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/23) || (dst net 8.0.194.0/24) || (dst net 8.0.195.0/25) || (dst net 8.0.195.128/28) || (dst net 8.0.195.144/30) || (dst net 8.0.195.148/31) || (dst net 8.0.195.150/32) || (dst net 8.0.195.152/29) || (dst net 8.0.195.160/27) || (dst net 8.0.195.192/26) || (dst net 8.0.196.0/22) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/22) || (dst net 8.0.212.0/27) || (dst net 8.0.212.32/30) || (dst net 8.0.212.36/31) || (dst net 8.0.212.38/32) || (dst net 8.0.212.40/29) || (dst net 8.0.212.48/28) || (dst net 8.0.212.64/26) || (dst net 8.0.212.128/25) || (dst net 8.0.213.0/24) || (dst net 8.0.214.0/23) || (dst net 8.0.216.0/21) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 18491) || (dst port 18615) || (dst port 27687) || (dst port 50914) || (dst port 51372)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/22) || (dst net 8.0.68.0/25) || (dst net 8.0.68.128/26) || (dst net 8.0.68.192/27) || (dst net 8.0.68.224/29) || (dst net 8.0.68.232/31) || (dst net 8.0.68.234/32) || (dst net 8.0.68.236/30) || (dst net 8.0.68.240/28) || (dst net 8.0.69.0/24) || (dst net 8.0.70.0/23) || (dst net 8.0.72.0/21) || (dst net 8.0.80.0/20) || (dst net 8.0.96.0/23) || (dst net 8.0.98.0/24) || (dst net 8.0.99.0/25) || (dst net 8.0.99.128/26) || (dst net 8.0.99.192/29) || (dst net 8.0.99.200/30) || (dst net 8.0.99.204/31) || (dst net 8.0.99.207/32) || (dst net 8.0.99.208/28) || (dst net 8.0.99.224/27) || (dst net 8.0.100.0/22) || (dst net 8.0.104.0/21) || (dst net 8.0.112.0/20) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/24) || (dst net 8.0.177.0/27) || (dst net 8.0.177.32/28) || (dst net 8.0.177.48/31) || (dst net 8.0.177.50/32) || (dst net 8.0.177.52/30) || (dst net 8.0.177.56/29) || (dst net 8.0.177.64/26) || (dst net 8.0.177.128/25) || (dst net 8.0.178.0/23) || (dst net 8.0.180.0/22) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/23) || (dst net 8.0.242.0/25) || (dst net 8.0.242.128/28) || (dst net 8.0.242.144/30) || (dst net 8.0.242.149/32) || (dst net 8.0.242.150/31) || (dst net 8.0.242.152/29) || (dst net 8.0.242.160/27) || (dst net 8.0.242.192/26) || (dst net 8.0.243.0/25) || (dst net 8.0.243.128/26) || (dst net 8.0.243.192/31) || (dst net 8.0.243.195/32) || (dst net 8.0.243.196/30) || (dst net 8.0.243.200/29) || (dst net 8.0.243.208/28) || (dst net 8.0.243.224/27) || (dst net 8.0.244.0/22) || (dst net 8.0.248.0/21) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 8942) || (dst port 11592) || (dst port 26093) || (dst port 39389) || (dst port 53723)) && ((dst net 8.0.0.0/23) || (dst net 8.0.2.0/25) || (dst net 8.0.2.128/26) || (dst net 8.0.2.192/27) || (dst net 8.0.2.224/30) || (dst net 8.0.2.228/32) || (dst net 8.0.2.230/31) || (dst net 8.0.2.232/29) || (dst net 8.0.2.240/28) || (dst net 8.0.3.0/24) || (dst net 8.0.4.0/22) || (dst net 8.0.8.0/21) || (dst net 8.0.16.0/20) || (dst net 8.0.32.0/20) || (dst net 8.0.48.0/24) || (dst net 8.0.49.0/28) || (dst net 8.0.49.16/29) || (dst net 8.0.49.24/31) || (dst net 8.0.49.26/32) || (dst net 8.0.49.28/30) || (dst net 8.0.49.32/27) || (dst net 8.0.49.64/26) || (dst net 8.0.49.128/27) || (dst net 8.0.49.160/29) || (dst net 8.0.49.169/32) || (dst net 8.0.49.170/31) || (dst net 8.0.49.172/30) || (dst net 8.0.49.176/28) || (dst net 8.0.49.192/26) || (dst net 8.0.50.0/23) || (dst net 8.0.52.0/22) || (dst net 8.0.56.0/22) || (dst net 8.0.60.0/23) || (dst net 8.0.62.0/26) || (dst net 8.0.62.64/27) || (dst net 8.0.62.96/28) || (dst net 8.0.62.112/29) || (dst net 8.0.62.120/31) || (dst net 8.0.62.123/32) || (dst net 8.0.62.124/30) || (dst net 8.0.62.128/25) || (dst net 8.0.63.0/24) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/18) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/21) || (dst net 8.0.248.0/23) || (dst net 8.0.250.0/24) || (dst net 8.0.251.0/25) || (dst net 8.0.251.128/27) || (dst net 8.0.251.160/28) || (dst net 8.0.251.176/30) || (dst net 8.0.251.180/31) || (dst net 8.0.251.182/32) || (dst net 8.0.251.184/29) || (dst net 8.0.251.192/26) || (dst net 8.0.252.0/22) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 6661) || (dst port 14379) || (dst port 41598) || (dst port 45614) || (dst port 52087)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/21) || (dst net 8.0.40.0/26) || (dst net 8.0.40.64/27) || (dst net 8.0.40.96/32) || (dst net 8.0.40.98/31) || (dst net 8.0.40.100/30) || (dst net 8.0.40.104/29) || (dst net 8.0.40.112/28) || (dst net 8.0.40.128/25) || (dst net 8.0.41.0/24) || (dst net 8.0.42.0/23) || (dst net 8.0.44.0/22) || (dst net 8.0.48.0/21) || (dst net 8.0.56.0/23) || (dst net 8.0.58.0/24) || (dst net 8.0.59.0/25) || (dst net 8.0.59.128/26) || (dst net 8.0.59.192/29) || (dst net 8.0.59.200/30) || (dst net 8.0.59.204/32) || (dst net 8.0.59.206/31) || (dst net 8.0.59.208/28) || (dst net 8.0.59.224/27) || (dst net 8.0.60.0/22) || (dst net 8.0.64.0/24) || (dst net 8.0.65.0/25) || (dst net 8.0.65.128/26) || (dst net 8.0.65.192/28) || (dst net 8.0.65.208/30) || (dst net 8.0.65.212/31) || (dst net 8.0.65.215/32) || (dst net 8.0.65.216/29) || (dst net 8.0.65.224/27) || (dst net 8.0.66.0/23) || (dst net 8.0.68.0/22) || (dst net 8.0.72.0/21) || (dst net 8.0.80.0/20) || (dst net 8.0.96.0/19) || (dst net 8.0.128.0/18) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/22) || (dst net 8.0.212.0/28) || (dst net 8.0.212.17/32) || (dst net 8.0.212.18/31) || (dst net 8.0.212.20/30) || (dst net 8.0.212.24/29) || (dst net 8.0.212.32/27) || (dst net 8.0.212.64/26) || (dst net 8.0.212.128/25) || (dst net 8.0.213.0/24) || (dst net 8.0.214.0/23) || (dst net 8.0.216.0/21) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/21) || (dst net 8.0.248.0/22) || (dst net 8.0.252.0/25) || (dst net 8.0.252.128/26) || (dst net 8.0.252.192/27) || (dst net 8.0.252.224/29) || (dst net 8.0.252.232/31) || (dst net 8.0.252.234/32) || (dst net 8.0.252.236/30) || (dst net 8.0.252.240/28) || (dst net 8.0.253.0/24) || (dst net 8.0.254.0/23) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 7696) || (dst port 14877) || (dst port 20892) || (dst port 39205) || (dst port 45865)) && ((dst net 8.0.0.0/21) || (dst net 8.0.8.0/22) || (dst net 8.0.12.0/23) || (dst net 8.0.14.0/26) || (dst net 8.0.14.64/27) || (dst net 8.0.14.96/28) || (dst net 8.0.14.112/31) || (dst net 8.0.14.114/32) || (dst net 8.0.14.116/30) || (dst net 8.0.14.120/29) || (dst net 8.0.14.128/25) || (dst net 8.0.15.0/24) || (dst net 8.0.16.0/20) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/23) || (dst net 8.0.162.0/27) || (dst net 8.0.162.32/29) || (dst net 8.0.162.40/32) || (dst net 8.0.162.42/31) || (dst net 8.0.162.44/30) || (dst net 8.0.162.48/28) || (dst net 8.0.162.64/26) || (dst net 8.0.162.128/25) || (dst net 8.0.163.0/24) || (dst net 8.0.164.0/22) || (dst net 8.0.168.0/23) || (dst net 8.0.170.0/24) || (dst net 8.0.171.0/26) || (dst net 8.0.171.64/27) || (dst net 8.0.171.96/30) || (dst net 8.0.171.100/31) || (dst net 8.0.171.102/32) || (dst net 8.0.171.104/29) || (dst net 8.0.171.112/28) || (dst net 8.0.171.128/25) || (dst net 8.0.172.0/22) || (dst net 8.0.176.0/23) || (dst net 8.0.178.0/27) || (dst net 8.0.178.32/28) || (dst net 8.0.178.48/29) || (dst net 8.0.178.56/30) || (dst net 8.0.178.60/31) || (dst net 8.0.178.63/32) || (dst net 8.0.178.64/26) || (dst net 8.0.178.128/25) || (dst net 8.0.179.0/24) || (dst net 8.0.180.0/22) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/25) || (dst net 8.0.192.128/26) || (dst net 8.0.192.192/31) || (dst net 8.0.192.195/32) || (dst net 8.0.192.196/30) || (dst net 8.0.192.200/29) || (dst net 8.0.192.208/28) || (dst net 8.0.192.224/27) || (dst net 8.0.193.0/24) || (dst net 8.0.194.0/23) || (dst net 8.0.196.0/22) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/20) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 9374) || (dst port 10596) || (dst port 31807) || (dst port 46072) || (dst port 56377)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/22) || (dst net 8.0.84.0/26) || (dst net 8.0.84.64/27) || (dst net 8.0.84.96/30) || (dst net 8.0.84.100/32) || (dst net 8.0.84.102/31) || (dst net 8.0.84.104/29) || (dst net 8.0.84.112/28) || (dst net 8.0.84.128/25) || (dst net 8.0.85.0/24) || (dst net 8.0.86.0/23) || (dst net 8.0.88.0/21) || (dst net 8.0.96.0/19) || (dst net 8.0.128.0/22) || (dst net 8.0.132.0/23) || (dst net 8.0.134.0/25) || (dst net 8.0.134.128/27) || (dst net 8.0.134.160/28) || (dst net 8.0.134.176/32) || (dst net 8.0.134.178/31) || (dst net 8.0.134.180/30) || (dst net 8.0.134.184/29) || (dst net 8.0.134.192/26) || (dst net 8.0.135.0/24) || (dst net 8.0.136.0/22) || (dst net 8.0.140.0/24) || (dst net 8.0.141.0/25) || (dst net 8.0.141.128/26) || (dst net 8.0.141.192/29) || (dst net 8.0.141.200/30) || (dst net 8.0.141.204/31) || (dst net 8.0.141.207/32) || (dst net 8.0.141.208/28) || (dst net 8.0.141.224/27) || (dst net 8.0.142.0/23) || (dst net 8.0.144.0/22) || (dst net 8.0.148.0/23) || (dst net 8.0.150.0/25) || (dst net 8.0.150.128/30) || (dst net 8.0.150.132/31) || (dst net 8.0.150.134/32) || (dst net 8.0.150.136/29) || (dst net 8.0.150.144/28) || (dst net 8.0.150.160/27) || (dst net 8.0.150.192/26) || (dst net 8.0.151.0/24) || (dst net 8.0.152.0/21) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/23) || (dst net 8.0.194.0/24) || (dst net 8.0.195.0/27) || (dst net 8.0.195.32/28) || (dst net 8.0.195.48/29) || (dst net 8.0.195.56/32) || (dst net 8.0.195.58/31) || (dst net 8.0.195.60/30) || (dst net 8.0.195.64/26) || (dst net 8.0.195.128/25) || (dst net 8.0.196.0/22) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/20) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 20365) || (dst port 28236) || (dst port 33954) || (dst port 34639) || (dst port 38544)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/23) || (dst net 8.0.34.0/25) || (dst net 8.0.34.128/27) || (dst net 8.0.34.160/30) || (dst net 8.0.34.164/32) || (dst net 8.0.34.166/31) || (dst net 8.0.34.168/29) || (dst net 8.0.34.176/28) || (dst net 8.0.34.192/26) || (dst net 8.0.35.0/24) || (dst net 8.0.36.0/22) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/25) || (dst net 8.0.80.128/26) || (dst net 8.0.80.192/27) || (dst net 8.0.80.224/30) || (dst net 8.0.80.228/31) || (dst net 8.0.80.231/32) || (dst net 8.0.80.232/29) || (dst net 8.0.80.240/28) || (dst net 8.0.81.0/24) || (dst net 8.0.82.0/23) || (dst net 8.0.84.0/22) || (dst net 8.0.88.0/21) || (dst net 8.0.96.0/19) || (dst net 8.0.128.0/21) || (dst net 8.0.136.0/22) || (dst net 8.0.140.0/23) || (dst net 8.0.142.0/25) || (dst net 8.0.142.128/29) || (dst net 8.0.142.136/30) || (dst net 8.0.142.140/32) || (dst net 8.0.142.142/31) || (dst net 8.0.142.144/28) || (dst net 8.0.142.160/27) || (dst net 8.0.142.192/26) || (dst net 8.0.143.0/24) || (dst net 8.0.144.0/20) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/21) || (dst net 8.0.184.0/22) || (dst net 8.0.188.0/24) || (dst net 8.0.189.0/27) || (dst net 8.0.189.32/28) || (dst net 8.0.189.49/32) || (dst net 8.0.189.50/31) || (dst net 8.0.189.52/30) || (dst net 8.0.189.56/29) || (dst net 8.0.189.64/26) || (dst net 8.0.189.128/25) || (dst net 8.0.190.0/23) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/27) || (dst net 8.0.208.32/28) || (dst net 8.0.208.48/31) || (dst net 8.0.208.50/32) || (dst net 8.0.208.52/30) || (dst net 8.0.208.56/29) || (dst net 8.0.208.64/26) || (dst net 8.0.208.128/25) || (dst net 8.0.209.0/24) || (dst net 8.0.210.0/23) || (dst net 8.0.212.0/22) || (dst net 8.0.216.0/21) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;
getIPClas2 :: CycleCountAccum;
getIPClas3 :: CycleCountAccum;
getIPClas4 :: CycleCountAccum;
getIPClas5 :: CycleCountAccum;
getIPClas6 :: CycleCountAccum;
getIPClas7 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
ipclassifier[2] -> getIPClas2 -> Discard ();
ipclassifier[3] -> getIPClas3 -> Discard ();
ipclassifier[4] -> getIPClas4 -> Discard ();
ipclassifier[5] -> getIPClas5 -> Discard ();
ipclassifier[6] -> getIPClas6 -> Discard ();
ipclassifier[7] -> getIPClas7 -> Discard ();
/////////////////////////////////////////////////////////////////////////////
// Configuration
define(
	$iface0      em4,
	$macAddr0    ec:f4:bb:d5:fe:d5,
	$ipAddr0     100.0.0.1,
	$ipNetHost0  100.0.0.0/32,
	$ipBcast0    100.0.0.255/32,
	$ipNet0      100.0.0.0/24,
	$color0      1,

	$iface1      eth0,
	$macAddr1    00:60:6e:d5:8a:b8,
	$ipAddr1     200.0.0.1,
	$ipNetHost1  200.0.0.0/32,
	$ipBcast1    200.0.0.255/32,
	$ipNet1      200.0.0.0/24,
	$color1      2,

	$gwIPAddr    200.0.0.2,
	$gwMACAddr   00:00:00:00:00:04,
	$gwPort      2,

	$queueSize   1000000,
	$mtuSize     9000,
	$burst       8
);
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Elements
elementclass IPClassifierBench {
	// Module's arguments
	$iface0, $macAddr0,  $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1,  $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method |

	// Queues
	queue :: Queue($queueSize);

	// Module's I/O
	in  :: FromDevice($iface0, BURST $burst);
	out :: ToDevice  ($iface1, BURST $burst);
	
	// ARP Querier
	etherEncap :: EtherEncap(0x0800, $macAddr1, $gwMACAddr);

	// Strip Ethernet header
	strip :: Strip(14);

	// Check IP header's integrity
	markIPHeader :: MarkIPHeader;

	// Measure the incoming pkt rate
	getRate :: AverageCounter;

	/////////////////////////////////////////////////////////////////////
	// Interface's pipeline
	/////////////////////////////////////////////////////////////////////
	// Input
	in -> getRate -> strip;

	// Output
	Idle -> etherEncap -> queue -> out;

	
ipclassifier :: IPClassifier(
	((dst port 5312) || (dst port 13995) || (dst port 14015) || (dst port 25482) || (dst port 41260)) && ((dst net 8.0.0.0/20) || (dst net 8.0.16.0/22) || (dst net 8.0.20.0/25) || (dst net 8.0.20.128/26) || (dst net 8.0.20.192/27) || (dst net 8.0.20.224/29) || (dst net 8.0.20.232/30) || (dst net 8.0.20.237/32) || (dst net 8.0.20.238/31) || (dst net 8.0.20.240/28) || (dst net 8.0.21.0/24) || (dst net 8.0.22.0/23) || (dst net 8.0.24.0/27) || (dst net 8.0.24.32/28) || (dst net 8.0.24.48/30) || (dst net 8.0.24.53/32) || (dst net 8.0.24.54/31) || (dst net 8.0.24.56/29) || (dst net 8.0.24.64/26) || (dst net 8.0.24.128/25) || (dst net 8.0.25.0/24) || (dst net 8.0.26.0/23) || (dst net 8.0.28.0/22) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/22) || (dst net 8.0.180.0/24) || (dst net 8.0.181.0/26) || (dst net 8.0.181.64/27) || (dst net 8.0.181.96/28) || (dst net 8.0.181.112/29) || (dst net 8.0.181.120/30) || (dst net 8.0.181.124/32) || (dst net 8.0.181.126/31) || (dst net 8.0.181.128/25) || (dst net 8.0.182.0/23) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/23) || (dst net 8.0.194.0/24) || (dst net 8.0.195.0/25) || (dst net 8.0.195.128/28) || (dst net 8.0.195.144/30) || (dst net 8.0.195.148/31) || (dst net 8.0.195.150/32) || (dst net 8.0.195.152/29) || (dst net 8.0.195.160/27) || (dst net 8.0.195.192/26) || (dst net 8.0.196.0/22) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/22) || (dst net 8.0.212.0/27) || (dst net 8.0.212.32/30) || (dst net 8.0.212.36/31) || (dst net 8.0.212.38/32) || (dst net 8.0.212.40/29) || (dst net 8.0.212.48/28) || (dst net 8.0.212.64/26) || (dst net 8.0.212.128/25) || (dst net 8.0.213.0/24) || (dst net 8.0.214.0/23) || (dst net 8.0.216.0/21) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 18491) || (dst port 18615) || (dst port 27687) || (dst port 50914) || (dst port 51372)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/22) || (dst net 8.0.68.0/25) || (dst net 8.0.68.128/26) || (dst net 8.0.68.192/27) || (dst net 8.0.68.224/29) || (dst net 8.0.68.232/31) || (dst net 8.0.68.234/32) || (dst net 8.0.68.236/30) || (dst net 8.0.68.240/28) || (dst net 8.0.69.0/24) || (dst net 8.0.70.0/23) || (dst net 8.0.72.0/21) || (dst net 8.0.80.0/20) || (dst net 8.0.96.0/23) || (dst net 8.0.98.0/24) || (dst net 8.0.99.0/25) || (dst net 8.0.99.128/26) || (dst net 8.0.99.192/29) || (dst net 8.0.99.200/30) || (dst net 8.0.99.204/31) || (dst net 8.0.99.207/32) || (dst net 8.0.99.208/28) || (dst net 8.0.99.224/27) || (dst net 8.0.100.0/22) || (dst net 8.0.104.0/21) || (dst net 8.0.112.0/20) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/24) || (dst net 8.0.177.0/27) || (dst net 8.0.177.32/28) || (dst net 8.0.177.48/31) || (dst net 8.0.177.50/32) || (dst net 8.0.177.52/30) || (dst net 8.0.177.56/29) || (dst net 8.0.177.64/26) || (dst net 8.0.177.128/25) || (dst net 8.0.178.0/23) || (dst net 8.0.180.0/22) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/23) || (dst net 8.0.242.0/25) || (dst net 8.0.242.128/28) || (dst net 8.0.242.144/30) || (dst net 8.0.242.149/32) || (dst net 8.0.242.150/31) || (dst net 8.0.242.152/29) || (dst net 8.0.242.160/27) || (dst net 8.0.242.192/26) || (dst net 8.0.243.0/25) || (dst net 8.0.243.128/26) || (dst net 8.0.243.192/31) || (dst net 8.0.243.195/32) || (dst net 8.0.243.196/30) || (dst net 8.0.243.200/29) || (dst net 8.0.243.208/28) || (dst net 8.0.243.224/27) || (dst net 8.0.244.0/22) || (dst net 8.0.248.0/21) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 8942) || (dst port 11592) || (dst port 26093) || (dst port 39389) || (dst port 53723)) && ((dst net 8.0.0.0/23) || (dst net 8.0.2.0/25) || (dst net 8.0.2.128/26) || (dst net 8.0.2.192/27) || (dst net 8.0.2.224/30) || (dst net 8.0.2.228/32) || (dst net 8.0.2.230/31) || (dst net 8.0.2.232/29) || (dst net 8.0.2.240/28) || (dst net 8.0.3.0/24) || (dst net 8.0.4.0/22) || (dst net 8.0.8.0/21) || (dst net 8.0.16.0/20) || (dst net 8.0.32.0/20) || (dst net 8.0.48.0/24) || (dst net 8.0.49.0/28) || (dst net 8.0.49.16/29) || (dst net 8.0.49.24/31) || (dst net 8.0.49.26/32) || (dst net 8.0.49.28/30) || (dst net 8.0.49.32/27) || (dst net 8.0.49.64/26) || (dst net 8.0.49.128/27) || (dst net 8.0.49.160/29) || (dst net 8.0.49.169/32) || (dst net 8.0.49.170/31) || (dst net 8.0.49.172/30) || (dst net 8.0.49.176/28) || (dst net 8.0.49.192/26) || (dst net 8.0.50.0/23) || (dst net 8.0.52.0/22) || (dst net 8.0.56.0/22) || (dst net 8.0.60.0/23) || (dst net 8.0.62.0/26) || (dst net 8.0.62.64/27) || (dst net 8.0.62.96/28) || (dst net 8.0.62.112/29) || (dst net 8.0.62.120/31) || (dst net 8.0.62.123/32) || (dst net 8.0.62.124/30) || (dst net 8.0.62.128/25) || (dst net 8.0.63.0/24) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/18) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/21) || (dst net 8.0.248.0/23) || (dst net 8.0.250.0/24) || (dst net 8.0.251.0/25) || (dst net 8.0.251.128/27) || (dst net 8.0.251.160/28) || (dst net 8.0.251.176/30) || (dst net 8.0.251.180/31) || (dst net 8.0.251.182/32) || (dst net 8.0.251.184/29) || (dst net 8.0.251.192/26) || (dst net 8.0.252.0/22) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 6661) || (dst port 14379) || (dst port 41598) || (dst port 45614) || (dst port 52087)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/21) || (dst net 8.0.40.0/26) || (dst net 8.0.40.64/27) || (dst net 8.0.40.96/32) || (dst net 8.0.40.98/31) || (dst net 8.0.40.100/30) || (dst net 8.0.40.104/29) || (dst net 8.0.40.112/28) || (dst net 8.0.40.128/25) || (dst net 8.0.41.0/24) || (dst net 8.0.42.0/23) || (dst net 8.0.44.0/22) || (dst net 8.0.48.0/21) || (dst net 8.0.56.0/23) || (dst net 8.0.58.0/24) || (dst net 8.0.59.0/25) || (dst net 8.0.59.128/26) || (dst net 8.0.59.192/29) || (dst net 8.0.59.200/30) || (dst net 8.0.59.204/32) || (dst net 8.0.59.206/31) || (dst net 8.0.59.208/28) || (dst net 8.0.59.224/27) || (dst net 8.0.60.0/22) || (dst net 8.0.64.0/24) || (dst net 8.0.65.0/25) || (dst net 8.0.65.128/26) || (dst net 8.0.65.192/28) || (dst net 8.0.65.208/30) || (dst net 8.0.65.212/31) || (dst net 8.0.65.215/32) || (dst net 8.0.65.216/29) || (dst net 8.0.65.224/27) || (dst net 8.0.66.0/23) || (dst net 8.0.68.0/22) || (dst net 8.0.72.0/21) || (dst net 8.0.80.0/20) || (dst net 8.0.96.0/19) || (dst net 8.0.128.0/18) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/22) || (dst net 8.0.212.0/28) || (dst net 8.0.212.17/32) || (dst net 8.0.212.18/31) || (dst net 8.0.212.20/30) || (dst net 8.0.212.24/29) || (dst net 8.0.212.32/27) || (dst net 8.0.212.64/26) || (dst net 8.0.212.128/25) || (dst net 8.0.213.0/24) || (dst net 8.0.214.0/23) || (dst net 8.0.216.0/21) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/21) || (dst net 8.0.248.0/22) || (dst net 8.0.252.0/25) || (dst net 8.0.252.128/26) || (dst net 8.0.252.192/27) || (dst net 8.0.252.224/29) || (dst net 8.0.252.232/31) || (dst net 8.0.252.234/32) || (dst net 8.0.252.236/30) || (dst net 8.0.252.240/28) || (dst net 8.0.253.0/24) || (dst net 8.0.254.0/23) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 7696) || (dst port 14877) || (dst port 20892) || (dst port 39205) || (dst port 45865)) && ((dst net 8.0.0.0/21) || (dst net 8.0.8.0/22) || (dst net 8.0.12.0/23) || (dst net 8.0.14.0/26) || (dst net 8.0.14.64/27) || (dst net 8.0.14.96/28) || (dst net 8.0.14.112/31) || (dst net 8.0.14.114/32) || (dst net 8.0.14.116/30) || (dst net 8.0.14.120/29) || (dst net 8.0.14.128/25) || (dst net 8.0.15.0/24) || (dst net 8.0.16.0/20) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/23) || (dst net 8.0.162.0/27) || (dst net 8.0.162.32/29) || (dst net 8.0.162.40/32) || (dst net 8.0.162.42/31) || (dst net 8.0.162.44/30) || (dst net 8.0.162.48/28) || (dst net 8.0.162.64/26) || (dst net 8.0.162.128/25) || (dst net 8.0.163.0/24) || (dst net 8.0.164.0/22) || (dst net 8.0.168.0/23) || (dst net 8.0.170.0/24) || (dst net 8.0.171.0/26) || (dst net 8.0.171.64/27) || (dst net 8.0.171.96/30) || (dst net 8.0.171.100/31) || (dst net 8.0.171.102/32) || (dst net 8.0.171.104/29) || (dst net 8.0.171.112/28) || (dst net 8.0.171.128/25) || (dst net 8.0.172.0/22) || (dst net 8.0.176.0/23) || (dst net 8.0.178.0/27) || (dst net 8.0.178.32/28) || (dst net 8.0.178.48/29) || (dst net 8.0.178.56/30) || (dst net 8.0.178.60/31) || (dst net 8.0.178.63/32) || (dst net 8.0.178.64/26) || (dst net 8.0.178.128/25) || (dst net 8.0.179.0/24) || (dst net 8.0.180.0/22) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/25) || (dst net 8.0.192.128/26) || (dst net 8.0.192.192/31) || (dst net 8.0.192.195/32) || (dst net 8.0.192.196/30) || (dst net 8.0.192.200/29) || (dst net 8.0.192.208/28) || (dst net 8.0.192.224/27) || (dst net 8.0.193.0/24) || (dst net 8.0.194.0/23) || (dst net 8.0.196.0/22) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/20) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 9374) || (dst port 10596) || (dst port 31807) || (dst port 46072) || (dst port 56377)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/22) || (dst net 8.0.84.0/26) || (dst net 8.0.84.64/27) || (dst net 8.0.84.96/30) || (dst net 8.0.84.100/32) || (dst net 8.0.84.102/31) || (dst net 8.0.84.104/29) || (dst net 8.0.84.112/28) || (dst net 8.0.84.128/25) || (dst net 8.0.85.0/24) || (dst net 8.0.86.0/23) || (dst net 8.0.88.0/21) || (dst net 8.0.96.0/19) || (dst net 8.0.128.0/22) || (dst net 8.0.132.0/23) || (dst net 8.0.134.0/25) || (dst net 8.0.134.128/27) || (dst net 8.0.134.160/28) || (dst net 8.0.134.176/32) || (dst net 8.0.134.178/31) || (dst net 8.0.134.180/30) || (dst net 8.0.134.184/29) || (dst net 8.0.134.192/26) || (dst net 8.0.135.0/24) || (dst net 8.0.136.0/22) || (dst net 8.0.140.0/24) || (dst net 8.0.141.0/25) || (dst net 8.0.141.128/26) || (dst net 8.0.141.192/29) || (dst net 8.0.141.200/30) || (dst net 8.0.141.204/31) || (dst net 8.0.141.207/32) || (dst net 8.0.141.208/28) || (dst net 8.0.141.224/27) || (dst net 8.0.142.0/23) || (dst net 8.0.144.0/22) || (dst net 8.0.148.0/23) || (dst net 8.0.150.0/25) || (dst net 8.0.150.128/30) || (dst net 8.0.150.132/31) || (dst net 8.0.150.134/32) || (dst net 8.0.150.136/29) || (dst net 8.0.150.144/28) || (dst net 8.0.150.160/27) || (dst net 8.0.150.192/26) || (dst net 8.0.151.0/24) || (dst net 8.0.152.0/21) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/23) || (dst net 8.0.194.0/24) || (dst net 8.0.195.0/27) || (dst net 8.0.195.32/28) || (dst net 8.0.195.48/29) || (dst net 8.0.195.56/32) || (dst net 8.0.195.58/31) || (dst net 8.0.195.60/30) || (dst net 8.0.195.64/26) || (dst net 8.0.195.128/25) || (dst net 8.0.196.0/22) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/20) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 20365) || (dst port 28236) || (dst port 33954) || (dst port 34639) || (dst port 38544)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/23) || (dst net 8.0.34.0/25) || (dst net 8.0.34.128/27) || (dst net 8.0.34.160/30) || (dst net 8.0.34.164/32) || (dst net 8.0.34.166/31) || (dst net 8.0.34.168/29) || (dst net 8.0.34.176/28) || (dst net 8.0.34.192/26) || (dst net 8.0.35.0/24) || (dst net 8.0.36.0/22) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/25) || (dst net 8.0.80.128/26) || (dst net 8.0.80.192/27) || (dst net 8.0.80.224/30) || (dst net 8.0.80.228/31) || (dst net 8.0.80.231/32) || (dst net 8.0.80.232/29) || (dst net 8.0.80.240/28) || (dst net 8.0.81.0/24) || (dst net 8.0.82.0/23) || (dst net 8.0.84.0/22) || (dst net 8.0.88.0/21) || (dst net 8.0.96.0/19) || (dst net 8.0.128.0/21) || (dst net 8.0.136.0/22) || (dst net 8.0.140.0/23) || (dst net 8.0.142.0/25) || (dst net 8.0.142.128/29) || (dst net 8.0.142.136/30) || (dst net 8.0.142.140/32) || (dst net 8.0.142.142/31) || (dst net 8.0.142.144/28) || (dst net 8.0.142.160/27) || (dst net 8.0.142.192/26) || (dst net 8.0.143.0/24) || (dst net 8.0.144.0/20) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/21) || (dst net 8.0.184.0/22) || (dst net 8.0.188.0/24) || (dst net 8.0.189.0/27) || (dst net 8.0.189.32/28) || (dst net 8.0.189.49/32) || (dst net 8.0.189.50/31) || (dst net 8.0.189.52/30) || (dst net 8.0.189.56/29) || (dst net 8.0.189.64/26) || (dst net 8.0.189.128/25) || (dst net 8.0.190.0/23) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/27) || (dst net 8.0.208.32/28) || (dst net 8.0.208.48/31) || (dst net 8.0.208.50/32) || (dst net 8.0.208.52/30) || (dst net 8.0.208.56/29) || (dst net 8.0.208.64/26) || (dst net 8.0.208.128/25) || (dst net 8.0.209.0/24) || (dst net 8.0.210.0/23) || (dst net 8.0.212.0/22) || (dst net 8.0.216.0/21) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;
getIPClas2 :: CycleCountAccum;
getIPClas3 :: CycleCountAccum;
getIPClas4 :: CycleCountAccum;
getIPClas5 :: CycleCountAccum;
getIPClas6 :: CycleCountAccum;
getIPClas7 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
ipclassifier[2] -> getIPClas2 -> Discard ();
ipclassifier[3] -> getIPClas3 -> Discard ();
ipclassifier[4] -> getIPClas4 -> Discard ();
ipclassifier[5] -> getIPClas5 -> Discard ();
ipclassifier[6] -> getIPClas6 -> Discard ();
ipclassifier[7] -> getIPClas7 -> Discard ();
	
}
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Scenario
/////////////////////////////////////////////////////////////////////////////
ipclassifier :: IPClassifierBench(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method
);
/////////////////////////////////////////////////////////////////////////////
