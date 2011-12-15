#!/bin/bash

computers=`dscl /LDAPv3/od1-sdob.ad.barabooschools.net -list Computers`

for c in $computers
do
	gp=`dsgrouputil -o checkmember -t computer -m $c -g z_allcomputers`
	if echo $gp | grep -q "*not*"
		then echo $gp
	fi
done
