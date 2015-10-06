/** NAT going to: NF_2,netmap:nf2veth1, BURST 32, METHOD NETMAP **/
iprw2 :: IPRewriter(pattern 200.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw2[1] -> EtherEncap(0x0800, $macAddr1, $gwMACAddr1) -> Queue ($queueSize) -> ToDevice ($iface1, BURST 32, METHOD NETMAP);
iprw2[0] -> Discard ();

/** NAT going to: NF_2,netmap:nf2veth0, BURST 32, METHOD NETMAP **/
iprw1 :: IPRewriter(pattern 200.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw1[1] -> Discard ();
iprw1[0] -> Discard ();

/** NAT going to: NF_1,netmap:nf1veth0, BURST 32, METHOD NETMAP **/
iprw0 :: IPRewriter(pattern 11.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw0[1] -> EtherEncap(0x0800, $macAddr0, $gwMACAddr0) -> Queue ($queueSize) -> ToDevice ($iface0, BURST 32, METHOD NETMAP);
iprw0[0] -> Discard ();

ipc0 :: IPClassifier (
	(((dst net 10.0.0.0/24) && !((dst net 10.0.0.1/32) || (dst net 11.0.0.1/32)))),
	(((dst net 11.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.1/32) || (dst net 11.0.0.2/32) || (dst net 200.0.0.1/32)))),
	(((dst net 0.0.0.0/0) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 200.0.0.0/24)))) || (((dst net 200.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 200.0.0.1/32)))),
);
ipc0[0] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw0;
ipc0[1] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw1;
ipc0[2] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw2;
FromDevice ($iface0) -> Strip(14) -> MarkIPHeader() -> ipc0;
