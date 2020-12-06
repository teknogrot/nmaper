#!/usr/bin/env bash

# A simple script to automate the port enumeration process as described on the Hack The Box website #

input=$1
echo "Target host is $input."
output=$1"_results"
echo "Open ports will be saved to $output.txt."
echo "Running port enumeration."
ports=$(nmap -p- --min-rate=1000 -T4 $input | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
echo "Ports found on $input are: $ports" > $output.txt
echo "Running service detection."
nmap -sC -sV -p$ports $input -oA $input

usage()
{
	# display usage message #
	echo
	echo "Usage format is <scriptname> <ip address> <output file>"
	echo
}
