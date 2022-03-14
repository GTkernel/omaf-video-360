#Accept to forward video360 traffic
iptables -I FORWARD -d 192.168.1.161 -m tcp -p tcp --dport 31500 -j ACCEPT
#Accept to forward video360 return traffic    
iptables -I FORWARD -s 192.168.1.161 -m tcp -p tcp --sport 31500 -j ACCEPT
#redirect pkts to k8s nodeport
iptables -t nat -I PREROUTING -m tcp -p tcp --dport 5000 -j DNAT --to-destination 192.168.1.161:31500
#NAT the src ip
iptables -t nat -I POSTROUTING -d 192.168.1.161 -o eno1 -j MASQUERADE
