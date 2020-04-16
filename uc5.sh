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
	
	case $position in 
		97)
			position=4
			;;
		35)
			position=24
			;;
		49)
			position=25
			;;
		32)
			position=22
			;;
		87)
			position=66
			;;
		16)
			position=3
			;;
		esac
		
		
		echo $position	
done
echo "the player won the game"
