#!/usr/bin/bash

echo "playing the game with two players"

players=1;
plyr_1_pos=0;
plyr_2_pos=0;
i=1;
contPlr_1[$i]=0;
contPlr_2[$i]=0;

while (( $plyr_1_pos < 100 && $plyr_2_pos < 100 ))
do

	result=$((RANDOM%6 +1))
	ladder=$((RANDOM%6 +1))
	snake=$((RANDOM%6 +1))
	pos1=$plyr_1_pos;
	plyr_1_pos=$(($plyr_1_pos + $result ))
	
	case $result in
		$ladder)
			plyr_1_pos=$(( $plyr_1_pos + $ladder +2 ))
			;;
		$snake)
			plyr_1_pos=$(( $plyr_1_pos - $snake -2 ))
	esac
	

	if (( $plyr_1_pos > 100 ));
	then
		plyr_1_pos=$pos1
	fi
	
		contPlr_1[ ((i++)) ]=$plyr_1_pos
		
	
	result=$((RANDOM%6 +1))
	ladder=$((RANDOM%6 +1))
	snake=$((RANDOM%6 +1))
	pos2=$plyr_2_pos;
	plyr_2_pos=$(($plyr_2_pos + $result ))
	
	case $result in
		$ladder)
			plyr_2_pos=$(( $plyr_2_pos + $ladder +2 ))
			;;
		$snake)
			plyr_2_pos=$(( $plyr_2_pos - $snake -2 ))
	esac
	

	if (( $plyr_2_pos > 100 ));
	then
		plyr_2_pos=$pos2
	fi
	
		contPlr_2[ ((i++)) ]=$plyr_2_pos
done

echo ${#contPlr_1[@]}
echo ${contPlr_1[@]}
echo ${#contPlr_2[@]}
echo ${contPlr_2[@]}

if (($plyr_1_pos == 100));
then
	echo "he player one won the game"
else
	echo "The player two won the game"
fi
