#!/usr/bin/env bash

# A simple script to automate the port enumeration process as described on the Hack The Box website #

ports=$(nmap -p- --min-rate=1000 -T4 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
nmap -sC -sV -p$ports $1 -oA $2

usage()
{
	# display usage message #
	echo
	echo "Usage format is <scriptname> <ip address> <output file>"
	echo
}
