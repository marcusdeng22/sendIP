#! /bin/bash

if [ $# -ne 2 ]; then
	echo "usage: ./sendIP_infinite.sh <email target> <subject>"
	exit 1
fi

OLDIP=0.0.0.0
TARG=$1
SUBJ=$2

while true
do
	NEWIP=$(dig @resolver1.opendns.com ANY myip.opendns.com +short)
	if [ $OLDIP != $NEWIP ]; then
		MSG="OLDIP: $OLDIP; changed to $NEWIP"
		echo $MSG
		#send mail
		mail -s $SUBJ $TARG <<< $MSG
		OLDIP=$NEWIP
	fi
	sleep $((60 * 5))	#60 seconds * 5 = 5 minutes
#	echo $OLDIP
#	echo $NEWIP
done
