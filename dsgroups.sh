#!/bin/bash

# gather list of all computers in OD

computers=`dscl /LDAPv3/od1-sdob.ad.barabooschools.net -list Computers`

# check membership in our top-level computer group, z_allcomputers.
# machines should be assigned to lower-level groups, all of which eventually are members of z_allcomputers.
# print computername only if not member of z_allcomputers

for c in $computers
do
	gp=`dsgrouputil -o checkmember -t computer -m $c -g z_allcomputers`
	if echo $gp | grep -q "*not*"
		then echo $gp
	fi
done

exit 0