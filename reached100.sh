#!/usr/bin/bash

echo "rolling the dice upto reaching 100"


players=1;
position=0;

while (( $position < 100  ))
do

	result=$((RANDOM%6 +1))

	ladder=$((RANDOM%6 +1))
	snake=$((RANDOM%6 +1))
	position1=$position;
	position=$(($position + $result ))
	

	case $result in
		$ladder)
			position=$(( $position + $ladder +2 ))
			;;
		$snake)
			position=$(( $position - $snake -2 ))
	esac
	
	
	
	if (( $position > 100 ));
	then
		position=$position1
	fi
	
	echo $position
		
done
