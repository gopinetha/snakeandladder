#!/usr/bin/bash

echo "snake and ladder game with  multiple players"

declare -a playerpos

read -p "enter the no of players : " no_of_players;



function movement()
{
no_of_dices=1
plyr_pos=0
while (( $plyr_pos < 100 ))
do

	result=$((RANDOM%6 +1))
	ladder=$((RANDOM%6 +1))
	snake=$((RANDOM%6 +1))
	pos1=$plyr_pos;
	plyr_pos=$(($plyr_pos + $result ))
	
	case $result in
		$ladder)
			plyr_pos=$(( $plyr_pos + $ladder +$((RANDOM%50))+1 ))
			;;
		$snake)
			plyr_pos=$(( $plyr_pos - $snake -$((RANDOM%$plyr_pos))+1 ))
	esac
	

	if (( $plyr_pos > 100 ));
	then
		plyr_pos=$pos1
	fi

		((no_of_dices++))
done
echo $no_of_dices
}

function display_winner()
{

cont_dice=1000;
winning_player=0
	
	for ((player=no_of_players;player>0;player--))
	do
		if (( ${playerpos[$player]} <= cont_dice  ))
		then 
			cont_dice=${playerpos[$player]}
			winning_player=$player
		fi
	done
	echo $winning_player
}

for ((player=1; player<=no_of_players; player++))
do

	playerpos[$player]="$(movement)"
	echo ${playerpos[$player]}

done
echo ${playerpos[@]}

display_winner