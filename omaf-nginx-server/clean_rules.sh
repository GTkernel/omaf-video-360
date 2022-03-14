#!/bin/bash
## iptables cleaning example
#iptables -t nat -D PREROUTING 3
#iptables -D FORWARD 20

forward_arr=($(iptables -L FORWARD --line-numbers | awk '/gtue/{print $1}'))

for (( i=0; i<${#forward_arr[@]}; i++ )); do iptables -D FORWARD "${forward_arr[0]}" ; done

nat_prer=$(iptables -L PREROUTING -t nat --line-numbers | awk '/191/{print $1}')
[ ! -z "$nat_prer" ] && iptables -t nat -D PREROUTING $nat_prer
nat_postr=$(iptables -L POSTROUTING -t nat --line-numbers | awk '/gtue/{print $1}')
[ ! -z "$nat_postr" ] && iptables -t nat -D POSTROUTING $nat_postr
