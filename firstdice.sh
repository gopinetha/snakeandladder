#!/usr/bin/bash

echo "rolling the dice for the 1st time"

players=1;
position=0;
result=$((RANDOM%6 +1))

position=$(($position + $result ))

echo $position