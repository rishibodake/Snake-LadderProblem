#!/bin/bash -x
#Discription:Snake & Ladder as per usercases
#Author:Hrishikesh M Bodake
#Since:March 7 2020 / Saturday

startPosition=0
finishPosition=100
currentPosition=0
#dicePos=0
function rollDice(){
	dicePos=$((RANDOM%6+1))
#	echo $dicePos
}
function snake(){
	if [[ $currentPosition -le 0 ]]
	then
		currentPosition=0
	else
		currentposition=$(($currentPosition-$dicePos))
	fi
}
function ladder(){
	currentPosition=$(($currentPosition+$dicePos))
}
function noPlay(){
	currentPosition=$(($currentPosition+0))
}
function play(){
	choice=$((RANDOM%3))
	rollDice
	case $choice in 
						0)
							noPlay;;
						1)
							snake;;
						2)
							ladder;;
						*)
							echo Wrong
	esac
}
play
