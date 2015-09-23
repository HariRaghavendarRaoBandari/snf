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
	((dst port 28792) || (dst port 30294) || (dst port 41468) || (dst port 54049) || (dst port 62350)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/21) || (dst net 8.0.120.0/25) || (dst net 8.0.120.128/27) || (dst net 8.0.120.160/30) || (dst net 8.0.120.164/32) || (dst net 8.0.120.166/31) || (dst net 8.0.120.168/29) || (dst net 8.0.120.176/28) || (dst net 8.0.120.192/26) || (dst net 8.0.121.0/24) || (dst net 8.0.122.0/23) || (dst net 8.0.124.0/22) || (dst net 8.0.128.0/24) || (dst net 8.0.129.0/25) || (dst net 8.0.129.128/30) || (dst net 8.0.129.132/31) || (dst net 8.0.129.134/32) || (dst net 8.0.129.136/29) || (dst net 8.0.129.144/28) || (dst net 8.0.129.160/27) || (dst net 8.0.129.192/26) || (dst net 8.0.130.0/23) || (dst net 8.0.132.0/22) || (dst net 8.0.136.0/21) || (dst net 8.0.144.0/21) || (dst net 8.0.152.0/24) || (dst net 8.0.153.0/25) || (dst net 8.0.153.128/27) || (dst net 8.0.153.160/28) || (dst net 8.0.153.176/30) || (dst net 8.0.153.181/32) || (dst net 8.0.153.182/31) || (dst net 8.0.153.184/29) || (dst net 8.0.153.192/26) || (dst net 8.0.154.0/23) || (dst net 8.0.156.0/22) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/24) || (dst net 8.0.193.0/25) || (dst net 8.0.193.129/32) || (dst net 8.0.193.130/31) || (dst net 8.0.193.132/30) || (dst net 8.0.193.136/29) || (dst net 8.0.193.144/28) || (dst net 8.0.193.160/27) || (dst net 8.0.193.192/26) || (dst net 8.0.194.0/23) || (dst net 8.0.196.0/22) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/24) || (dst net 8.0.209.0/26) || (dst net 8.0.209.64/29) || (dst net 8.0.209.72/30) || (dst net 8.0.209.76/32) || (dst net 8.0.209.78/31) || (dst net 8.0.209.80/28) || (dst net 8.0.209.96/27) || (dst net 8.0.209.128/25) || (dst net 8.0.210.0/23) || (dst net 8.0.212.0/22) || (dst net 8.0.216.0/21) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 6778) || (dst port 18961) || (dst port 27134) || (dst port 33715) || (dst port 35221)) && ((dst net 8.0.0.0/17) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/26) || (dst net 8.0.176.64/27) || (dst net 8.0.176.96/31) || (dst net 8.0.176.99/32) || (dst net 8.0.176.100/30) || (dst net 8.0.176.104/29) || (dst net 8.0.176.112/28) || (dst net 8.0.176.128/25) || (dst net 8.0.177.0/24) || (dst net 8.0.178.0/24) || (dst net 8.0.179.0/25) || (dst net 8.0.179.128/26) || (dst net 8.0.179.192/30) || (dst net 8.0.179.196/32) || (dst net 8.0.179.198/31) || (dst net 8.0.179.200/29) || (dst net 8.0.179.208/28) || (dst net 8.0.179.224/27) || (dst net 8.0.180.0/22) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/21) || (dst net 8.0.216.0/24) || (dst net 8.0.217.0/25) || (dst net 8.0.217.128/26) || (dst net 8.0.217.192/27) || (dst net 8.0.217.224/29) || (dst net 8.0.217.232/30) || (dst net 8.0.217.236/31) || (dst net 8.0.217.239/32) || (dst net 8.0.217.240/28) || (dst net 8.0.218.0/23) || (dst net 8.0.220.0/22) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/22) || (dst net 8.0.244.0/26) || (dst net 8.0.244.64/28) || (dst net 8.0.244.80/30) || (dst net 8.0.244.84/31) || (dst net 8.0.244.87/32) || (dst net 8.0.244.88/29) || (dst net 8.0.244.96/27) || (dst net 8.0.244.128/25) || (dst net 8.0.245.0/24) || (dst net 8.0.246.0/23) || (dst net 8.0.248.0/22) || (dst net 8.0.252.0/25) || (dst net 8.0.252.128/27) || (dst net 8.0.252.160/28) || (dst net 8.0.252.176/30) || (dst net 8.0.252.180/31) || (dst net 8.0.252.182/32) || (dst net 8.0.252.184/29) || (dst net 8.0.252.192/26) || (dst net 8.0.253.0/24) || (dst net 8.0.254.0/23) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 1251) || (dst port 46304) || (dst port 46901) || (dst port 48610) || (dst port 52477)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/25) || (dst net 8.0.112.128/27) || (dst net 8.0.112.160/30) || (dst net 8.0.112.164/31) || (dst net 8.0.112.166/32) || (dst net 8.0.112.168/29) || (dst net 8.0.112.176/28) || (dst net 8.0.112.192/26) || (dst net 8.0.113.0/24) || (dst net 8.0.114.0/23) || (dst net 8.0.116.0/22) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/20) || (dst net 8.0.144.0/23) || (dst net 8.0.146.0/24) || (dst net 8.0.147.0/25) || (dst net 8.0.147.128/27) || (dst net 8.0.147.160/30) || (dst net 8.0.147.165/32) || (dst net 8.0.147.166/31) || (dst net 8.0.147.168/29) || (dst net 8.0.147.176/28) || (dst net 8.0.147.192/26) || (dst net 8.0.148.0/22) || (dst net 8.0.152.0/21) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/21) || (dst net 8.0.184.0/23) || (dst net 8.0.186.0/25) || (dst net 8.0.186.128/26) || (dst net 8.0.186.192/28) || (dst net 8.0.186.208/31) || (dst net 8.0.186.211/32) || (dst net 8.0.186.212/30) || (dst net 8.0.186.216/29) || (dst net 8.0.186.224/27) || (dst net 8.0.187.0/24) || (dst net 8.0.188.0/22) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/21) || (dst net 8.0.216.0/22) || (dst net 8.0.220.0/23) || (dst net 8.0.222.0/25) || (dst net 8.0.222.128/29) || (dst net 8.0.222.136/32) || (dst net 8.0.222.138/31) || (dst net 8.0.222.140/30) || (dst net 8.0.222.144/28) || (dst net 8.0.222.160/27) || (dst net 8.0.222.192/26) || (dst net 8.0.223.0/24) || (dst net 8.0.224.0/26) || (dst net 8.0.224.64/27) || (dst net 8.0.224.96/29) || (dst net 8.0.224.105/32) || (dst net 8.0.224.106/31) || (dst net 8.0.224.108/30) || (dst net 8.0.224.112/28) || (dst net 8.0.224.128/25) || (dst net 8.0.225.0/24) || (dst net 8.0.226.0/23) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 13078) || (dst port 32044) || (dst port 43758) || (dst port 44700) || (dst port 60074)) && ((dst net 8.0.0.0/20) || (dst net 8.0.16.0/25) || (dst net 8.0.16.128/27) || (dst net 8.0.16.160/28) || (dst net 8.0.16.177/32) || (dst net 8.0.16.178/31) || (dst net 8.0.16.180/30) || (dst net 8.0.16.184/29) || (dst net 8.0.16.192/26) || (dst net 8.0.17.0/24) || (dst net 8.0.18.0/23) || (dst net 8.0.20.0/22) || (dst net 8.0.24.0/21) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/22) || (dst net 8.0.116.0/23) || (dst net 8.0.118.0/25) || (dst net 8.0.118.128/28) || (dst net 8.0.118.144/29) || (dst net 8.0.118.152/30) || (dst net 8.0.118.156/32) || (dst net 8.0.118.158/31) || (dst net 8.0.118.160/27) || (dst net 8.0.118.192/26) || (dst net 8.0.119.0/24) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/22) || (dst net 8.0.132.0/23) || (dst net 8.0.134.0/26) || (dst net 8.0.134.64/27) || (dst net 8.0.134.96/30) || (dst net 8.0.134.100/31) || (dst net 8.0.134.103/32) || (dst net 8.0.134.104/29) || (dst net 8.0.134.112/28) || (dst net 8.0.134.128/25) || (dst net 8.0.135.0/24) || (dst net 8.0.136.0/21) || (dst net 8.0.144.0/20) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/22) || (dst net 8.0.180.0/23) || (dst net 8.0.182.0/25) || (dst net 8.0.182.128/27) || (dst net 8.0.182.160/30) || (dst net 8.0.182.165/32) || (dst net 8.0.182.166/31) || (dst net 8.0.182.168/29) || (dst net 8.0.182.176/28) || (dst net 8.0.182.192/26) || (dst net 8.0.183.0/24) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/23) || (dst net 8.0.226.0/25) || (dst net 8.0.226.128/26) || (dst net 8.0.226.192/28) || (dst net 8.0.226.208/30) || (dst net 8.0.226.213/32) || (dst net 8.0.226.214/31) || (dst net 8.0.226.216/29) || (dst net 8.0.226.224/27) || (dst net 8.0.227.0/24) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 14125) || (dst port 20692) || (dst port 29231) || (dst port 33729) || (dst port 64840)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/23) || (dst net 8.0.34.0/24) || (dst net 8.0.35.0/25) || (dst net 8.0.35.128/27) || (dst net 8.0.35.160/31) || (dst net 8.0.35.163/32) || (dst net 8.0.35.164/30) || (dst net 8.0.35.168/29) || (dst net 8.0.35.176/28) || (dst net 8.0.35.192/26) || (dst net 8.0.36.0/22) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/23) || (dst net 8.0.114.0/24) || (dst net 8.0.115.0/26) || (dst net 8.0.115.64/29) || (dst net 8.0.115.72/31) || (dst net 8.0.115.75/32) || (dst net 8.0.115.76/30) || (dst net 8.0.115.80/28) || (dst net 8.0.115.96/27) || (dst net 8.0.115.128/25) || (dst net 8.0.116.0/22) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/21) || (dst net 8.0.136.0/23) || (dst net 8.0.138.0/24) || (dst net 8.0.139.0/26) || (dst net 8.0.139.64/32) || (dst net 8.0.139.66/31) || (dst net 8.0.139.68/30) || (dst net 8.0.139.72/29) || (dst net 8.0.139.80/28) || (dst net 8.0.139.96/27) || (dst net 8.0.139.128/25) || (dst net 8.0.140.0/22) || (dst net 8.0.144.0/20) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/21) || (dst net 8.0.216.0/22) || (dst net 8.0.220.0/24) || (dst net 8.0.221.0/25) || (dst net 8.0.221.128/27) || (dst net 8.0.221.160/29) || (dst net 8.0.221.168/30) || (dst net 8.0.221.173/32) || (dst net 8.0.221.174/31) || (dst net 8.0.221.176/28) || (dst net 8.0.221.192/26) || (dst net 8.0.222.0/23) || (dst net 8.0.224.0/23) || (dst net 8.0.226.0/24) || (dst net 8.0.227.0/25) || (dst net 8.0.227.128/26) || (dst net 8.0.227.192/28) || (dst net 8.0.227.208/29) || (dst net 8.0.227.216/31) || (dst net 8.0.227.219/32) || (dst net 8.0.227.220/30) || (dst net 8.0.227.224/27) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 10066) || (dst port 13862) || (dst port 40394) || (dst port 41320) || (dst port 65480)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/21) || (dst net 8.0.88.0/22) || (dst net 8.0.92.0/24) || (dst net 8.0.93.0/26) || (dst net 8.0.93.64/27) || (dst net 8.0.93.96/28) || (dst net 8.0.93.112/29) || (dst net 8.0.93.120/31) || (dst net 8.0.93.122/32) || (dst net 8.0.93.124/30) || (dst net 8.0.93.128/25) || (dst net 8.0.94.0/23) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/25) || (dst net 8.0.112.128/28) || (dst net 8.0.112.144/31) || (dst net 8.0.112.147/32) || (dst net 8.0.112.148/30) || (dst net 8.0.112.152/29) || (dst net 8.0.112.160/27) || (dst net 8.0.112.192/26) || (dst net 8.0.113.0/24) || (dst net 8.0.114.0/23) || (dst net 8.0.116.0/23) || (dst net 8.0.118.0/24) || (dst net 8.0.119.0/25) || (dst net 8.0.119.128/27) || (dst net 8.0.119.160/28) || (dst net 8.0.119.176/32) || (dst net 8.0.119.178/31) || (dst net 8.0.119.180/30) || (dst net 8.0.119.184/29) || (dst net 8.0.119.192/26) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/18) || (dst net 8.0.192.0/21) || (dst net 8.0.200.0/22) || (dst net 8.0.204.0/23) || (dst net 8.0.206.0/25) || (dst net 8.0.206.128/31) || (dst net 8.0.206.131/32) || (dst net 8.0.206.132/30) || (dst net 8.0.206.136/29) || (dst net 8.0.206.144/28) || (dst net 8.0.206.160/27) || (dst net 8.0.206.192/26) || (dst net 8.0.207.0/24) || (dst net 8.0.208.0/20) || (dst net 8.0.224.0/24) || (dst net 8.0.225.0/25) || (dst net 8.0.225.128/27) || (dst net 8.0.225.160/29) || (dst net 8.0.225.168/30) || (dst net 8.0.225.173/32) || (dst net 8.0.225.174/31) || (dst net 8.0.225.176/28) || (dst net 8.0.225.192/26) || (dst net 8.0.226.0/23) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 13452) || (dst port 27376) || (dst port 44602) || (dst port 44729) || (dst port 54817)) && ((dst net 8.0.0.0/27) || (dst net 8.0.0.32/30) || (dst net 8.0.0.36/31) || (dst net 8.0.0.39/32) || (dst net 8.0.0.40/29) || (dst net 8.0.0.48/29) || (dst net 8.0.0.56/32) || (dst net 8.0.0.58/31) || (dst net 8.0.0.60/30) || (dst net 8.0.0.64/26) || (dst net 8.0.0.128/25) || (dst net 8.0.1.0/24) || (dst net 8.0.2.0/23) || (dst net 8.0.4.0/22) || (dst net 8.0.8.0/21) || (dst net 8.0.16.0/20) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/24) || (dst net 8.0.81.0/25) || (dst net 8.0.81.128/27) || (dst net 8.0.81.160/28) || (dst net 8.0.81.176/30) || (dst net 8.0.81.180/31) || (dst net 8.0.81.183/32) || (dst net 8.0.81.184/29) || (dst net 8.0.81.192/26) || (dst net 8.0.82.0/23) || (dst net 8.0.84.0/22) || (dst net 8.0.88.0/21) || (dst net 8.0.96.0/19) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/21) || (dst net 8.0.184.0/23) || (dst net 8.0.186.0/27) || (dst net 8.0.186.32/28) || (dst net 8.0.186.48/30) || (dst net 8.0.186.53/32) || (dst net 8.0.186.54/31) || (dst net 8.0.186.56/29) || (dst net 8.0.186.64/26) || (dst net 8.0.186.128/25) || (dst net 8.0.187.0/24) || (dst net 8.0.188.0/22) || (dst net 8.0.192.0/22) || (dst net 8.0.196.0/24) || (dst net 8.0.197.0/25) || (dst net 8.0.197.128/26) || (dst net 8.0.197.192/27) || (dst net 8.0.197.224/28) || (dst net 8.0.197.240/29) || (dst net 8.0.197.248/31) || (dst net 8.0.197.250/32) || (dst net 8.0.197.252/30) || (dst net 8.0.198.0/23) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/20) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
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
	((dst port 28792) || (dst port 30294) || (dst port 41468) || (dst port 54049) || (dst port 62350)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/21) || (dst net 8.0.120.0/25) || (dst net 8.0.120.128/27) || (dst net 8.0.120.160/30) || (dst net 8.0.120.164/32) || (dst net 8.0.120.166/31) || (dst net 8.0.120.168/29) || (dst net 8.0.120.176/28) || (dst net 8.0.120.192/26) || (dst net 8.0.121.0/24) || (dst net 8.0.122.0/23) || (dst net 8.0.124.0/22) || (dst net 8.0.128.0/24) || (dst net 8.0.129.0/25) || (dst net 8.0.129.128/30) || (dst net 8.0.129.132/31) || (dst net 8.0.129.134/32) || (dst net 8.0.129.136/29) || (dst net 8.0.129.144/28) || (dst net 8.0.129.160/27) || (dst net 8.0.129.192/26) || (dst net 8.0.130.0/23) || (dst net 8.0.132.0/22) || (dst net 8.0.136.0/21) || (dst net 8.0.144.0/21) || (dst net 8.0.152.0/24) || (dst net 8.0.153.0/25) || (dst net 8.0.153.128/27) || (dst net 8.0.153.160/28) || (dst net 8.0.153.176/30) || (dst net 8.0.153.181/32) || (dst net 8.0.153.182/31) || (dst net 8.0.153.184/29) || (dst net 8.0.153.192/26) || (dst net 8.0.154.0/23) || (dst net 8.0.156.0/22) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/24) || (dst net 8.0.193.0/25) || (dst net 8.0.193.129/32) || (dst net 8.0.193.130/31) || (dst net 8.0.193.132/30) || (dst net 8.0.193.136/29) || (dst net 8.0.193.144/28) || (dst net 8.0.193.160/27) || (dst net 8.0.193.192/26) || (dst net 8.0.194.0/23) || (dst net 8.0.196.0/22) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/24) || (dst net 8.0.209.0/26) || (dst net 8.0.209.64/29) || (dst net 8.0.209.72/30) || (dst net 8.0.209.76/32) || (dst net 8.0.209.78/31) || (dst net 8.0.209.80/28) || (dst net 8.0.209.96/27) || (dst net 8.0.209.128/25) || (dst net 8.0.210.0/23) || (dst net 8.0.212.0/22) || (dst net 8.0.216.0/21) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 6778) || (dst port 18961) || (dst port 27134) || (dst port 33715) || (dst port 35221)) && ((dst net 8.0.0.0/17) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/26) || (dst net 8.0.176.64/27) || (dst net 8.0.176.96/31) || (dst net 8.0.176.99/32) || (dst net 8.0.176.100/30) || (dst net 8.0.176.104/29) || (dst net 8.0.176.112/28) || (dst net 8.0.176.128/25) || (dst net 8.0.177.0/24) || (dst net 8.0.178.0/24) || (dst net 8.0.179.0/25) || (dst net 8.0.179.128/26) || (dst net 8.0.179.192/30) || (dst net 8.0.179.196/32) || (dst net 8.0.179.198/31) || (dst net 8.0.179.200/29) || (dst net 8.0.179.208/28) || (dst net 8.0.179.224/27) || (dst net 8.0.180.0/22) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/21) || (dst net 8.0.216.0/24) || (dst net 8.0.217.0/25) || (dst net 8.0.217.128/26) || (dst net 8.0.217.192/27) || (dst net 8.0.217.224/29) || (dst net 8.0.217.232/30) || (dst net 8.0.217.236/31) || (dst net 8.0.217.239/32) || (dst net 8.0.217.240/28) || (dst net 8.0.218.0/23) || (dst net 8.0.220.0/22) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/22) || (dst net 8.0.244.0/26) || (dst net 8.0.244.64/28) || (dst net 8.0.244.80/30) || (dst net 8.0.244.84/31) || (dst net 8.0.244.87/32) || (dst net 8.0.244.88/29) || (dst net 8.0.244.96/27) || (dst net 8.0.244.128/25) || (dst net 8.0.245.0/24) || (dst net 8.0.246.0/23) || (dst net 8.0.248.0/22) || (dst net 8.0.252.0/25) || (dst net 8.0.252.128/27) || (dst net 8.0.252.160/28) || (dst net 8.0.252.176/30) || (dst net 8.0.252.180/31) || (dst net 8.0.252.182/32) || (dst net 8.0.252.184/29) || (dst net 8.0.252.192/26) || (dst net 8.0.253.0/24) || (dst net 8.0.254.0/23) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 1251) || (dst port 46304) || (dst port 46901) || (dst port 48610) || (dst port 52477)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/25) || (dst net 8.0.112.128/27) || (dst net 8.0.112.160/30) || (dst net 8.0.112.164/31) || (dst net 8.0.112.166/32) || (dst net 8.0.112.168/29) || (dst net 8.0.112.176/28) || (dst net 8.0.112.192/26) || (dst net 8.0.113.0/24) || (dst net 8.0.114.0/23) || (dst net 8.0.116.0/22) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/20) || (dst net 8.0.144.0/23) || (dst net 8.0.146.0/24) || (dst net 8.0.147.0/25) || (dst net 8.0.147.128/27) || (dst net 8.0.147.160/30) || (dst net 8.0.147.165/32) || (dst net 8.0.147.166/31) || (dst net 8.0.147.168/29) || (dst net 8.0.147.176/28) || (dst net 8.0.147.192/26) || (dst net 8.0.148.0/22) || (dst net 8.0.152.0/21) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/21) || (dst net 8.0.184.0/23) || (dst net 8.0.186.0/25) || (dst net 8.0.186.128/26) || (dst net 8.0.186.192/28) || (dst net 8.0.186.208/31) || (dst net 8.0.186.211/32) || (dst net 8.0.186.212/30) || (dst net 8.0.186.216/29) || (dst net 8.0.186.224/27) || (dst net 8.0.187.0/24) || (dst net 8.0.188.0/22) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/21) || (dst net 8.0.216.0/22) || (dst net 8.0.220.0/23) || (dst net 8.0.222.0/25) || (dst net 8.0.222.128/29) || (dst net 8.0.222.136/32) || (dst net 8.0.222.138/31) || (dst net 8.0.222.140/30) || (dst net 8.0.222.144/28) || (dst net 8.0.222.160/27) || (dst net 8.0.222.192/26) || (dst net 8.0.223.0/24) || (dst net 8.0.224.0/26) || (dst net 8.0.224.64/27) || (dst net 8.0.224.96/29) || (dst net 8.0.224.105/32) || (dst net 8.0.224.106/31) || (dst net 8.0.224.108/30) || (dst net 8.0.224.112/28) || (dst net 8.0.224.128/25) || (dst net 8.0.225.0/24) || (dst net 8.0.226.0/23) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 13078) || (dst port 32044) || (dst port 43758) || (dst port 44700) || (dst port 60074)) && ((dst net 8.0.0.0/20) || (dst net 8.0.16.0/25) || (dst net 8.0.16.128/27) || (dst net 8.0.16.160/28) || (dst net 8.0.16.177/32) || (dst net 8.0.16.178/31) || (dst net 8.0.16.180/30) || (dst net 8.0.16.184/29) || (dst net 8.0.16.192/26) || (dst net 8.0.17.0/24) || (dst net 8.0.18.0/23) || (dst net 8.0.20.0/22) || (dst net 8.0.24.0/21) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/22) || (dst net 8.0.116.0/23) || (dst net 8.0.118.0/25) || (dst net 8.0.118.128/28) || (dst net 8.0.118.144/29) || (dst net 8.0.118.152/30) || (dst net 8.0.118.156/32) || (dst net 8.0.118.158/31) || (dst net 8.0.118.160/27) || (dst net 8.0.118.192/26) || (dst net 8.0.119.0/24) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/22) || (dst net 8.0.132.0/23) || (dst net 8.0.134.0/26) || (dst net 8.0.134.64/27) || (dst net 8.0.134.96/30) || (dst net 8.0.134.100/31) || (dst net 8.0.134.103/32) || (dst net 8.0.134.104/29) || (dst net 8.0.134.112/28) || (dst net 8.0.134.128/25) || (dst net 8.0.135.0/24) || (dst net 8.0.136.0/21) || (dst net 8.0.144.0/20) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/22) || (dst net 8.0.180.0/23) || (dst net 8.0.182.0/25) || (dst net 8.0.182.128/27) || (dst net 8.0.182.160/30) || (dst net 8.0.182.165/32) || (dst net 8.0.182.166/31) || (dst net 8.0.182.168/29) || (dst net 8.0.182.176/28) || (dst net 8.0.182.192/26) || (dst net 8.0.183.0/24) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/23) || (dst net 8.0.226.0/25) || (dst net 8.0.226.128/26) || (dst net 8.0.226.192/28) || (dst net 8.0.226.208/30) || (dst net 8.0.226.213/32) || (dst net 8.0.226.214/31) || (dst net 8.0.226.216/29) || (dst net 8.0.226.224/27) || (dst net 8.0.227.0/24) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 14125) || (dst port 20692) || (dst port 29231) || (dst port 33729) || (dst port 64840)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/23) || (dst net 8.0.34.0/24) || (dst net 8.0.35.0/25) || (dst net 8.0.35.128/27) || (dst net 8.0.35.160/31) || (dst net 8.0.35.163/32) || (dst net 8.0.35.164/30) || (dst net 8.0.35.168/29) || (dst net 8.0.35.176/28) || (dst net 8.0.35.192/26) || (dst net 8.0.36.0/22) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/23) || (dst net 8.0.114.0/24) || (dst net 8.0.115.0/26) || (dst net 8.0.115.64/29) || (dst net 8.0.115.72/31) || (dst net 8.0.115.75/32) || (dst net 8.0.115.76/30) || (dst net 8.0.115.80/28) || (dst net 8.0.115.96/27) || (dst net 8.0.115.128/25) || (dst net 8.0.116.0/22) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/21) || (dst net 8.0.136.0/23) || (dst net 8.0.138.0/24) || (dst net 8.0.139.0/26) || (dst net 8.0.139.64/32) || (dst net 8.0.139.66/31) || (dst net 8.0.139.68/30) || (dst net 8.0.139.72/29) || (dst net 8.0.139.80/28) || (dst net 8.0.139.96/27) || (dst net 8.0.139.128/25) || (dst net 8.0.140.0/22) || (dst net 8.0.144.0/20) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/21) || (dst net 8.0.216.0/22) || (dst net 8.0.220.0/24) || (dst net 8.0.221.0/25) || (dst net 8.0.221.128/27) || (dst net 8.0.221.160/29) || (dst net 8.0.221.168/30) || (dst net 8.0.221.173/32) || (dst net 8.0.221.174/31) || (dst net 8.0.221.176/28) || (dst net 8.0.221.192/26) || (dst net 8.0.222.0/23) || (dst net 8.0.224.0/23) || (dst net 8.0.226.0/24) || (dst net 8.0.227.0/25) || (dst net 8.0.227.128/26) || (dst net 8.0.227.192/28) || (dst net 8.0.227.208/29) || (dst net 8.0.227.216/31) || (dst net 8.0.227.219/32) || (dst net 8.0.227.220/30) || (dst net 8.0.227.224/27) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 10066) || (dst port 13862) || (dst port 40394) || (dst port 41320) || (dst port 65480)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/21) || (dst net 8.0.88.0/22) || (dst net 8.0.92.0/24) || (dst net 8.0.93.0/26) || (dst net 8.0.93.64/27) || (dst net 8.0.93.96/28) || (dst net 8.0.93.112/29) || (dst net 8.0.93.120/31) || (dst net 8.0.93.122/32) || (dst net 8.0.93.124/30) || (dst net 8.0.93.128/25) || (dst net 8.0.94.0/23) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/25) || (dst net 8.0.112.128/28) || (dst net 8.0.112.144/31) || (dst net 8.0.112.147/32) || (dst net 8.0.112.148/30) || (dst net 8.0.112.152/29) || (dst net 8.0.112.160/27) || (dst net 8.0.112.192/26) || (dst net 8.0.113.0/24) || (dst net 8.0.114.0/23) || (dst net 8.0.116.0/23) || (dst net 8.0.118.0/24) || (dst net 8.0.119.0/25) || (dst net 8.0.119.128/27) || (dst net 8.0.119.160/28) || (dst net 8.0.119.176/32) || (dst net 8.0.119.178/31) || (dst net 8.0.119.180/30) || (dst net 8.0.119.184/29) || (dst net 8.0.119.192/26) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/18) || (dst net 8.0.192.0/21) || (dst net 8.0.200.0/22) || (dst net 8.0.204.0/23) || (dst net 8.0.206.0/25) || (dst net 8.0.206.128/31) || (dst net 8.0.206.131/32) || (dst net 8.0.206.132/30) || (dst net 8.0.206.136/29) || (dst net 8.0.206.144/28) || (dst net 8.0.206.160/27) || (dst net 8.0.206.192/26) || (dst net 8.0.207.0/24) || (dst net 8.0.208.0/20) || (dst net 8.0.224.0/24) || (dst net 8.0.225.0/25) || (dst net 8.0.225.128/27) || (dst net 8.0.225.160/29) || (dst net 8.0.225.168/30) || (dst net 8.0.225.173/32) || (dst net 8.0.225.174/31) || (dst net 8.0.225.176/28) || (dst net 8.0.225.192/26) || (dst net 8.0.226.0/23) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 13452) || (dst port 27376) || (dst port 44602) || (dst port 44729) || (dst port 54817)) && ((dst net 8.0.0.0/27) || (dst net 8.0.0.32/30) || (dst net 8.0.0.36/31) || (dst net 8.0.0.39/32) || (dst net 8.0.0.40/29) || (dst net 8.0.0.48/29) || (dst net 8.0.0.56/32) || (dst net 8.0.0.58/31) || (dst net 8.0.0.60/30) || (dst net 8.0.0.64/26) || (dst net 8.0.0.128/25) || (dst net 8.0.1.0/24) || (dst net 8.0.2.0/23) || (dst net 8.0.4.0/22) || (dst net 8.0.8.0/21) || (dst net 8.0.16.0/20) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/24) || (dst net 8.0.81.0/25) || (dst net 8.0.81.128/27) || (dst net 8.0.81.160/28) || (dst net 8.0.81.176/30) || (dst net 8.0.81.180/31) || (dst net 8.0.81.183/32) || (dst net 8.0.81.184/29) || (dst net 8.0.81.192/26) || (dst net 8.0.82.0/23) || (dst net 8.0.84.0/22) || (dst net 8.0.88.0/21) || (dst net 8.0.96.0/19) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/21) || (dst net 8.0.184.0/23) || (dst net 8.0.186.0/27) || (dst net 8.0.186.32/28) || (dst net 8.0.186.48/30) || (dst net 8.0.186.53/32) || (dst net 8.0.186.54/31) || (dst net 8.0.186.56/29) || (dst net 8.0.186.64/26) || (dst net 8.0.186.128/25) || (dst net 8.0.187.0/24) || (dst net 8.0.188.0/22) || (dst net 8.0.192.0/22) || (dst net 8.0.196.0/24) || (dst net 8.0.197.0/25) || (dst net 8.0.197.128/26) || (dst net 8.0.197.192/27) || (dst net 8.0.197.224/28) || (dst net 8.0.197.240/29) || (dst net 8.0.197.248/31) || (dst net 8.0.197.250/32) || (dst net 8.0.197.252/30) || (dst net 8.0.198.0/23) || (dst net 8.0.200.0/21) || (dst net 8.0.208.0/20) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
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
