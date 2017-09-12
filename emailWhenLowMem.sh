#! /bin/bash

: '
This bash script will mail me or several other people using SMTP (25) if the disk availability reaches equal or less than 10G
'

diskAvail=$(df -Ph . | tail -1 | awk '{print $4}')

# echo $diskAvail

IFS="G"
tokenDisk=($diskAvail)
tokenDisk=${diskAvail[*]}

echo $tokenDisk

hostName="$(uname -n)"

export EMAIL="example@gmail.com,anotherExample@gmail.com,wowAnother@gmail.com,Excessive@gmail.com"
export SUBJ="Memory"

if [ $tokenDisk -le 30 ]
then
	# echo This is the $hostName talking, and you have about $diskAvail space left... So free something 
	mailx $EMAIL -s $SUBJ << EOF
		This is the $hostName talking, and you have about $diskAvail space left... So free something 
	EOF
fi

# Please don't run this without changing the EMAIL