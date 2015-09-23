ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 11855) || (dst port 15723) || (dst port 20810) || (dst port 46520) || (dst port 61467)) && ((dst net 8.0.0.0/25) || (dst net 8.0.0.128/26) || (dst net 8.0.0.192/30) || (dst net 8.0.0.197/32) || (dst net 8.0.0.198/31) || (dst net 8.0.0.200/29) || (dst net 8.0.0.208/28) || (dst net 8.0.0.224/27) || (dst net 8.0.1.0/24) || (dst net 8.0.2.0/23) || (dst net 8.0.4.0/23) || (dst net 8.0.6.0/25) || (dst net 8.0.6.128/26) || (dst net 8.0.6.192/27) || (dst net 8.0.6.224/32) || (dst net 8.0.6.226/31) || (dst net 8.0.6.228/30) || (dst net 8.0.6.232/29) || (dst net 8.0.6.240/28) || (dst net 8.0.7.0/24) || (dst net 8.0.8.0/21) || (dst net 8.0.16.0/22) || (dst net 8.0.20.0/23) || (dst net 8.0.22.0/24) || (dst net 8.0.23.0/26) || (dst net 8.0.23.64/29) || (dst net 8.0.23.72/31) || (dst net 8.0.23.74/32) || (dst net 8.0.23.76/30) || (dst net 8.0.23.80/28) || (dst net 8.0.23.96/27) || (dst net 8.0.23.128/25) || (dst net 8.0.24.0/21) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/22) || (dst net 8.0.68.0/23) || (dst net 8.0.70.0/26) || (dst net 8.0.70.64/29) || (dst net 8.0.70.72/31) || (dst net 8.0.70.74/32) || (dst net 8.0.70.76/30) || (dst net 8.0.70.80/28) || (dst net 8.0.70.96/27) || (dst net 8.0.70.128/25) || (dst net 8.0.71.0/24) || (dst net 8.0.72.0/21) || (dst net 8.0.80.0/20) || (dst net 8.0.96.0/21) || (dst net 8.0.104.0/23) || (dst net 8.0.106.0/29) || (dst net 8.0.106.8/30) || (dst net 8.0.106.12/31) || (dst net 8.0.106.14/32) || (dst net 8.0.106.16/28) || (dst net 8.0.106.32/27) || (dst net 8.0.106.64/26) || (dst net 8.0.106.128/25) || (dst net 8.0.107.0/24) || (dst net 8.0.108.0/22) || (dst net 8.0.112.0/20) || (dst net 8.0.128.0/17) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 9669) || (dst port 25410) || (dst port 32752) || (dst port 38483) || (dst port 55417)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/22) || (dst net 8.0.36.0/23) || (dst net 8.0.38.0/26) || (dst net 8.0.38.64/27) || (dst net 8.0.38.96/28) || (dst net 8.0.38.112/29) || (dst net 8.0.38.120/30) || (dst net 8.0.38.125/32) || (dst net 8.0.38.126/31) || (dst net 8.0.38.128/25) || (dst net 8.0.39.0/24) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/23) || (dst net 8.0.98.0/25) || (dst net 8.0.98.128/26) || (dst net 8.0.98.192/30) || (dst net 8.0.98.196/32) || (dst net 8.0.98.198/31) || (dst net 8.0.98.200/29) || (dst net 8.0.98.208/28) || (dst net 8.0.98.224/27) || (dst net 8.0.99.0/24) || (dst net 8.0.100.0/22) || (dst net 8.0.104.0/21) || (dst net 8.0.112.0/20) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/22) || (dst net 8.0.164.0/23) || (dst net 8.0.166.0/25) || (dst net 8.0.166.128/26) || (dst net 8.0.166.192/27) || (dst net 8.0.166.224/29) || (dst net 8.0.166.232/30) || (dst net 8.0.166.236/31) || (dst net 8.0.166.239/32) || (dst net 8.0.166.240/28) || (dst net 8.0.167.0/24) || (dst net 8.0.168.0/22) || (dst net 8.0.172.0/23) || (dst net 8.0.174.0/26) || (dst net 8.0.174.64/27) || (dst net 8.0.174.96/29) || (dst net 8.0.174.104/30) || (dst net 8.0.174.108/31) || (dst net 8.0.174.111/32) || (dst net 8.0.174.112/28) || (dst net 8.0.174.128/25) || (dst net 8.0.175.0/24) || (dst net 8.0.176.0/20) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/23) || (dst net 8.0.226.0/24) || (dst net 8.0.227.0/28) || (dst net 8.0.227.16/31) || (dst net 8.0.227.18/32) || (dst net 8.0.227.20/30) || (dst net 8.0.227.24/29) || (dst net 8.0.227.32/27) || (dst net 8.0.227.64/26) || (dst net 8.0.227.128/25) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 9294) || (dst port 16523) || (dst port 26789) || (dst port 32016) || (dst port 37022)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/22) || (dst net 8.0.36.0/24) || (dst net 8.0.37.0/25) || (dst net 8.0.37.128/26) || (dst net 8.0.37.192/27) || (dst net 8.0.37.224/29) || (dst net 8.0.37.232/30) || (dst net 8.0.37.236/32) || (dst net 8.0.37.238/31) || (dst net 8.0.37.240/28) || (dst net 8.0.38.0/23) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/21) || (dst net 8.0.136.0/22) || (dst net 8.0.140.0/23) || (dst net 8.0.142.0/26) || (dst net 8.0.142.64/27) || (dst net 8.0.142.97/32) || (dst net 8.0.142.98/31) || (dst net 8.0.142.100/30) || (dst net 8.0.142.104/29) || (dst net 8.0.142.112/28) || (dst net 8.0.142.128/25) || (dst net 8.0.143.0/24) || (dst net 8.0.144.0/22) || (dst net 8.0.148.0/23) || (dst net 8.0.150.0/24) || (dst net 8.0.151.0/28) || (dst net 8.0.151.16/31) || (dst net 8.0.151.19/32) || (dst net 8.0.151.20/30) || (dst net 8.0.151.24/29) || (dst net 8.0.151.32/27) || (dst net 8.0.151.64/26) || (dst net 8.0.151.128/25) || (dst net 8.0.152.0/21) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/22) || (dst net 8.0.244.0/25) || (dst net 8.0.244.128/28) || (dst net 8.0.244.144/30) || (dst net 8.0.244.148/31) || (dst net 8.0.244.150/32) || (dst net 8.0.244.152/29) || (dst net 8.0.244.160/27) || (dst net 8.0.244.192/26) || (dst net 8.0.245.0/24) || (dst net 8.0.246.0/23) || (dst net 8.0.248.0/23) || (dst net 8.0.250.0/24) || (dst net 8.0.251.0/25) || (dst net 8.0.251.128/27) || (dst net 8.0.251.160/28) || (dst net 8.0.251.176/29) || (dst net 8.0.251.184/31) || (dst net 8.0.251.186/32) || (dst net 8.0.251.188/30) || (dst net 8.0.251.192/26) || (dst net 8.0.252.0/22) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 8304) || (dst port 40740) || (dst port 41241) || (dst port 42681) || (dst port 52631)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/26) || (dst net 8.0.32.64/31) || (dst net 8.0.32.66/32) || (dst net 8.0.32.68/30) || (dst net 8.0.32.72/29) || (dst net 8.0.32.80/28) || (dst net 8.0.32.96/27) || (dst net 8.0.32.128/25) || (dst net 8.0.33.0/24) || (dst net 8.0.34.0/23) || (dst net 8.0.36.0/22) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/23) || (dst net 8.0.50.0/24) || (dst net 8.0.51.0/27) || (dst net 8.0.51.32/31) || (dst net 8.0.51.34/32) || (dst net 8.0.51.36/30) || (dst net 8.0.51.40/29) || (dst net 8.0.51.48/28) || (dst net 8.0.51.64/26) || (dst net 8.0.51.128/25) || (dst net 8.0.52.0/22) || (dst net 8.0.56.0/21) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/24) || (dst net 8.0.81.0/25) || (dst net 8.0.81.128/27) || (dst net 8.0.81.160/28) || (dst net 8.0.81.176/29) || (dst net 8.0.81.184/31) || (dst net 8.0.81.187/32) || (dst net 8.0.81.188/30) || (dst net 8.0.81.192/26) || (dst net 8.0.82.0/23) || (dst net 8.0.84.0/22) || (dst net 8.0.88.0/21) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/22) || (dst net 8.0.116.0/23) || (dst net 8.0.118.0/25) || (dst net 8.0.118.128/26) || (dst net 8.0.118.192/29) || (dst net 8.0.118.200/31) || (dst net 8.0.118.202/32) || (dst net 8.0.118.204/30) || (dst net 8.0.118.208/28) || (dst net 8.0.118.224/27) || (dst net 8.0.119.0/24) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/18) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/22) || (dst net 8.0.244.0/23) || (dst net 8.0.246.0/29) || (dst net 8.0.246.8/30) || (dst net 8.0.246.13/32) || (dst net 8.0.246.14/31) || (dst net 8.0.246.16/28) || (dst net 8.0.246.32/27) || (dst net 8.0.246.64/26) || (dst net 8.0.246.128/25) || (dst net 8.0.247.0/24) || (dst net 8.0.248.0/21) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 9307) || (dst port 26891) || (dst port 27951) || (dst port 59093) || (dst port 62096)) && ((dst net 8.0.0.0/22) || (dst net 8.0.4.0/23) || (dst net 8.0.6.0/24) || (dst net 8.0.7.0/26) || (dst net 8.0.7.64/31) || (dst net 8.0.7.66/32) || (dst net 8.0.7.68/30) || (dst net 8.0.7.72/29) || (dst net 8.0.7.80/28) || (dst net 8.0.7.96/27) || (dst net 8.0.7.128/25) || (dst net 8.0.8.0/21) || (dst net 8.0.16.0/20) || (dst net 8.0.32.0/20) || (dst net 8.0.48.0/22) || (dst net 8.0.52.0/29) || (dst net 8.0.52.9/32) || (dst net 8.0.52.10/31) || (dst net 8.0.52.12/30) || (dst net 8.0.52.16/28) || (dst net 8.0.52.32/27) || (dst net 8.0.52.64/26) || (dst net 8.0.52.128/25) || (dst net 8.0.53.0/24) || (dst net 8.0.54.0/23) || (dst net 8.0.56.0/22) || (dst net 8.0.60.0/23) || (dst net 8.0.62.0/24) || (dst net 8.0.63.0/26) || (dst net 8.0.63.64/27) || (dst net 8.0.63.96/28) || (dst net 8.0.63.112/31) || (dst net 8.0.63.114/32) || (dst net 8.0.63.116/30) || (dst net 8.0.63.120/29) || (dst net 8.0.63.128/25) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/23) || (dst net 8.0.98.0/24) || (dst net 8.0.99.0/25) || (dst net 8.0.99.128/27) || (dst net 8.0.99.160/29) || (dst net 8.0.99.168/31) || (dst net 8.0.99.171/32) || (dst net 8.0.99.172/30) || (dst net 8.0.99.176/28) || (dst net 8.0.99.192/26) || (dst net 8.0.100.0/22) || (dst net 8.0.104.0/21) || (dst net 8.0.112.0/21) || (dst net 8.0.120.0/24) || (dst net 8.0.121.0/25) || (dst net 8.0.121.128/26) || (dst net 8.0.121.192/27) || (dst net 8.0.121.224/28) || (dst net 8.0.121.240/29) || (dst net 8.0.121.249/32) || (dst net 8.0.121.250/31) || (dst net 8.0.121.252/30) || (dst net 8.0.122.0/23) || (dst net 8.0.124.0/22) || (dst net 8.0.128.0/17) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 8854) || (dst port 16584) || (dst port 23943) || (dst port 29839) || (dst port 51326)) && ((dst net 8.0.0.0/20) || (dst net 8.0.16.0/23) || (dst net 8.0.18.0/27) || (dst net 8.0.18.32/28) || (dst net 8.0.18.48/32) || (dst net 8.0.18.50/31) || (dst net 8.0.18.52/30) || (dst net 8.0.18.56/29) || (dst net 8.0.18.64/26) || (dst net 8.0.18.128/25) || (dst net 8.0.19.0/24) || (dst net 8.0.20.0/23) || (dst net 8.0.22.0/24) || (dst net 8.0.23.0/25) || (dst net 8.0.23.128/28) || (dst net 8.0.23.144/29) || (dst net 8.0.23.153/32) || (dst net 8.0.23.154/31) || (dst net 8.0.23.156/30) || (dst net 8.0.23.160/27) || (dst net 8.0.23.192/26) || (dst net 8.0.24.0/21) || (dst net 8.0.32.0/24) || (dst net 8.0.33.0/25) || (dst net 8.0.33.128/28) || (dst net 8.0.33.144/30) || (dst net 8.0.33.148/32) || (dst net 8.0.33.150/31) || (dst net 8.0.33.152/29) || (dst net 8.0.33.160/27) || (dst net 8.0.33.192/26) || (dst net 8.0.34.0/23) || (dst net 8.0.36.0/22) || (dst net 8.0.40.0/24) || (dst net 8.0.41.0/25) || (dst net 8.0.41.128/30) || (dst net 8.0.41.132/31) || (dst net 8.0.41.135/32) || (dst net 8.0.41.136/29) || (dst net 8.0.41.144/28) || (dst net 8.0.41.160/27) || (dst net 8.0.41.192/26) || (dst net 8.0.42.0/23) || (dst net 8.0.44.0/22) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/18) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/23) || (dst net 8.0.226.0/25) || (dst net 8.0.226.128/27) || (dst net 8.0.226.160/28) || (dst net 8.0.226.176/29) || (dst net 8.0.226.184/31) || (dst net 8.0.226.186/32) || (dst net 8.0.226.188/30) || (dst net 8.0.226.192/26) || (dst net 8.0.227.0/24) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
	((dst port 14106) || (dst port 16392) || (dst port 44539) || (dst port 56419) || (dst port 59568)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/20) || (dst net 8.0.80.0/21) || (dst net 8.0.88.0/24) || (dst net 8.0.89.0/26) || (dst net 8.0.89.64/27) || (dst net 8.0.89.96/28) || (dst net 8.0.89.112/29) || (dst net 8.0.89.120/31) || (dst net 8.0.89.122/32) || (dst net 8.0.89.124/30) || (dst net 8.0.89.128/25) || (dst net 8.0.90.0/23) || (dst net 8.0.92.0/22) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/23) || (dst net 8.0.114.0/24) || (dst net 8.0.115.0/25) || (dst net 8.0.115.128/26) || (dst net 8.0.115.192/29) || (dst net 8.0.115.200/31) || (dst net 8.0.115.203/32) || (dst net 8.0.115.204/30) || (dst net 8.0.115.208/28) || (dst net 8.0.115.224/27) || (dst net 8.0.116.0/22) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/22) || (dst net 8.0.164.0/23) || (dst net 8.0.166.0/25) || (dst net 8.0.166.128/26) || (dst net 8.0.166.192/28) || (dst net 8.0.166.208/31) || (dst net 8.0.166.210/32) || (dst net 8.0.166.212/30) || (dst net 8.0.166.216/29) || (dst net 8.0.166.224/27) || (dst net 8.0.167.0/24) || (dst net 8.0.168.0/21) || (dst net 8.0.176.0/20) || (dst net 8.0.192.0/21) || (dst net 8.0.200.0/22) || (dst net 8.0.204.0/23) || (dst net 8.0.206.0/24) || (dst net 8.0.207.0/28) || (dst net 8.0.207.16/29) || (dst net 8.0.207.25/32) || (dst net 8.0.207.26/31) || (dst net 8.0.207.28/30) || (dst net 8.0.207.32/27) || (dst net 8.0.207.64/26) || (dst net 8.0.207.128/25) || (dst net 8.0.208.0/20) || (dst net 8.0.224.0/21) || (dst net 8.0.232.0/22) || (dst net 8.0.236.0/23) || (dst net 8.0.238.0/25) || (dst net 8.0.238.128/30) || (dst net 8.0.238.133/32) || (dst net 8.0.238.134/31) || (dst net 8.0.238.136/29) || (dst net 8.0.238.144/28) || (dst net 8.0.238.160/27) || (dst net 8.0.238.192/26) || (dst net 8.0.239.0/24) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
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
