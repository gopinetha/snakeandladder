#!/usr/bin/bash

echo " snakes and ladders in the game"


players=1;
position=0;
result=$((RANDOM%6 +1))

ladder=$((RANDOM%6 +1))
snake=$((RANDOM%6 +1))

position=$(($position + $result ))

echo $position
echo $ladder
echo $snake

case $result in
	$ladder)
		position=$(( $position + $ladder +2 ))
		;;
	$snake)
		position=$(( $position - $snake -2 ))
	esac
	
echo $position