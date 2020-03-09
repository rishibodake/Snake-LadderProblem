#!/bin/bash -x
#Discription:Snake & Ladder as per usercases
#Author:Hrishikesh M Bodake
#Since:March 7 2020 / Saturday
diceCounter=0
startPosition=0
finishPosition=100
currentPosition=0
priviousPosition=0
#dicePos=0
function rollDice(){
	dicePos=$((RANDOM%6+1))
#	echo $dicePos
}
function snake(){
	if [[ $currentPosition -le 0 ]]
	then
		currentPosition=$currentPosition
	else
		currentPosition=$(($currentPosition-$dicePos))
	fi
}
function ladder(){
		priviousPosition=$currentPosition
		currentPosition=$(($currentPosition+$dicePos))
#		if [[ $priviousPosition -eq 100 ]]
#      then
#				exit
#      fi


}
function noPlay(){
	currentPosition=$(($currentPosition+0))
}
function play(){
	while [[ $currentPosition -lt $finishPosition ]]
	do
		choice=$((RANDOM%3))
		rollDice
		((diceCounter++))
		echo diceOucome is $dicePos
		case $choice in
						0)
							noPlay;;
						1)
							snake;;
						2)
								ladder
							;;
						*)
							echo Wrong
		esac
	 if [[ $currentPosition -gt $finishPosition ]]
    then
    	  currentPosition=$priviousPosition
    fi
done
}
play
