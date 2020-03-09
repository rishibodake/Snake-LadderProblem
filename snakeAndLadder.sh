#!/bin/bash -x
#Discription:Snake & Ladder as per usercases
#Author:Hrishikesh M Bodake
#Since:March 7 2020 / Saturday
diceCounter=0
termOfPlayer=1
startPosition=0
finishPosition=100
currentPosition=0
priviousPosition=0
player1Pos=0
player2Pos=0
winchecker=0
player=0
function rollDice(){
	dicePos=$((RANDOM%6+1))
}
function snake(){
	if [[ $player -eq 1 ]]
	then

		if [[ $player1Pos -le 0 ]]
		then
			player1Pos=$player1Pos
		else
			player1Pos=$(($player1Pos-$dicePos))
		fi
	elif [[ $player -eq 2 ]]
	then
		if [[ $player2Pos -le 0 ]]
      then
         player2Pos=$player2Pos
      else
         player2Pos=$(($player2Pos-$dicePos))
      fi
	fi
}
function ladder(){
if [[ $player -eq 1 ]]
then
		priviousPosition1=$player1Pos
		player1Pos=$(($player1Pos+$dicePos))
elif [[ $player -eq 2 ]]
then
		priviousPosition2=$player1Pos
      player2Pos=$(($player2Pos+$dicePos))
fi
}
function noPlay(){
if [[ $player -eq 1 ]]
then
	player1Pos=$(($player1Pos+0))
elif [[ $player -eq 2 ]]
then
	player2Pos=$(($player2Pos+0))
fi
}

function play(){
	while [[ $currentPosition -lt $finishPosition || $winchecker -eq 0 ]]
	do
		if [[ $termOfPlayer%2 -eq 0 ]]
		then
			player=1
		else
			player=2
		fi
		choice=$((RANDOM%3))
		rollDice
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
check
((termOfPlayer++))
done
}
check()
{
	if [[ $player1Pos -eq 100 ]]
	then
		echo "Player 1 Won the game"
		winchecker=1
		exit
	elif [[ $player2Pos -eq 100 ]]
	then
		echo "Player 2 Won the game"
		winchecker=1
		exit
	fi
}
play

