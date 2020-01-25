#!/bin/bash

source  config

if [ ! -f $FILENAME ]; then
	rm -rf $FILENAME
fi

echo "# Author : Galih < me@galihyoungest.web.id >" > $FILENAME
echo "# https://let.my.id/netflix/hosts.txt" >> $FILENAME
echo "# netflix-dns" >> $FILENAME

RESOLVER() {
	for ip in `dig $DOMAIN +short`; do
		if [ $? = 0 ]; then
			if  [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
				echo $ip $DOMAIN >> $FILENAME
			fi
		fi
	done
}

DOMAIN(){
	for dns in `cat $DOMAIN`; do
		DOMAIN=$dns
		RESOLVER
	done
}

CDN() {
	cat $CDN | grep -v "#" | while read i; do
	PREFIXNUMBER=`echo $i | cut -d ' ' -f3`
	PREFIX1=`echo $i | cut -d ' ' -f1`
	PREFIX2=`echo $i | cut -d ' ' -f2`
	if [ $PREFIXNUMBER == 1 ]; then
		for j in {1..100};do
			DOMAIN="$PREFIX1$j$PREFIX2"
			RESOLVER
		done
	elif [ $PREFIXNUMBER == 2 ]; then
		for j in {01..100};do
			DOMAIN="$PREFIX1$j$PREFIX2"
			RESOLVER
		done
	elif [ $PREFIXNUMBER == 3 ]; then
		for j in {001..100};do
			DOMAIN="$PREFIX1$j$PREFIX2"
			RESOLVER
		done
	else
		echo "out of scope"
	fi
	done
}

main() {
	DOMAIN
	CDN
}

main

echo "# Last update : `date`" >> $FILENAME
