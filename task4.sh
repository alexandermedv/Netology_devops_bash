#!/usr/bin/env bash

hosts=(192.168.0.1 173.194.222.113 87.250.250.24 locahost)
echo "Check hosts:" ${hosts[@]}
err=0

while (($err==0))
do
	for h in ${hosts[@]}
	do
		nc -z $h 80 &> /dev/null; c=$?
		if (($c!=0))
		then
			date >> errors_ip.log
			t="Порт 80 на хосте: ${h} не доступен."
			echo $t
			echo $t >> errors_ip.log
			err=1
			exit
		fi
	done
done