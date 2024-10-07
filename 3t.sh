#!/bin/bash

#Tic Tac Toe Game

#-------------------------------------------------------------------------------

PLAYER='o'
declare -a MATRIX=( [1]=' ' [2]=' ' [3]=' ' \
					[4]=' ' [5]=' ' [6]=' ' \
					[7]=' ' [8]=' ' [9]=' ' )

#-------------------------------------------------------------------------------

# Print game field

print_game_field() {
	clear
	echo "  1  2  3 "
	echo " --------"
	echo "1|${MATRIX[1]}|${MATRIX[2]}|${MATRIX[3]}|"
	echo " --------"
	echo "2|${MATRIX[4]}|${MATRIX[5]}|${MATRIX[6]}|"
	echo " --------"
	echo "3|${MATRIX[7]}|${MATRIX[8]}|${MATRIX[9]}|"
	echo " --------"
}

#-------------------------------------------------------------------------------

# Player's turn

players_turn() {
	if [ $PLAYER == 'o' ]; then
		PLAYER='x'
	else
		PLAYER='o'
	fi

	echo "Turn Player's: $PLAYER (row collumn):"
	read p_turns

	
	row=$(echo $p_turns | cut -d ' ' -f1)
	collumn=$(echo $p_turns | cut -d ' ' -f2)
	
	if [ $row -eq '1' ]; then
		if [ $collumn -eq '1' ]; then
			MATRIX[1]="$PLAYER"
		elif [ $collumn -eq '2' ]; then
			MATRIX[2]="$PLAYER"
		else
			MATRIX[3]="$PLAYER"
		fi
	elif [ $row -eq '2' ]; then
		if [ $collumn -eq '1' ]; then
			MATRIX[4]="$PLAYER"
		elif [ $collumn -eq '2' ]; then
			MATRIX[5]="$PLAYER"
		else
			MATRIX[6]="$PLAYER"
		fi
	else
		if [ $collumn -eq '1' ]; then
			MATRIX[7]="$PLAYER"
		elif [ $collumn -eq '2' ]; then
			MATRIX[8]="$PLAYER"
		else
			MATRIX[9]="$PLAYER"
		fi
	fi
}

#-------------------------------------------------------------------------------

# Checking win player

check_win() {
	if [[ "${MATRIX[1]}" == "$PLAYER" && \
		  "${MATRIX[2]}" == "$PLAYER" && \
		  "${MATRIX[3]}" == "$PLAYER" ]]; then
		congratulations
	elif [[ "${MATRIX[4]}" == "$PLAYER" && \
			"${MATRIX[5]}" == "$PLAYER" && \
			"${MATRIX[6]}" == "$PLAYER" ]]; then
		congratulations
	elif [[ "${MATRIX[7]}" == "$PLAYER" && \
			"${MATRIX[8]}" == "$PLAYER" && \
			"${MATRIX[9]}" == "$PLAYER" ]]; then
		congratulations
	elif [[ "${MATRIX[1]}" == "$PLAYER" && \
			"${MATRIX[4]}" == "$PLAYER" && \
			"${MATRIX[7]}" == "$PLAYER" ]]; then
		congratulations
	elif [[ "${MATRIX[2]}" == "$PLAYER" && \
			"${MATRIX[5]}" == "$PLAYER" && \
			"${MATRIX[8]}" == "$PLAYER" ]]; then
		congratulations
	elif [[ "${MATRIX[3]}" == "$PLAYER" && \
			"${MATRIX[6]}" == "$PLAYER" && \
			"${MATRIX[9]}" == "$PLAYER" ]]; then
		congratulations
	elif [[ "${MATRIX[1]}" == "$PLAYER" && \
			"${MATRIX[5]}" == "$PLAYER" && \
			"${MATRIX[9]}" == "$PLAYER" ]]; then
		congratulations
	elif [[ "${MATRIX[7]}" == "$PLAYER" && \
			"${MATRIX[5]}" == "$PLAYER" && \
			"${MATRIX[3]}" == "$PLAYER" ]]; then
		congratulations
	fi
}

#-------------------------------------------------------------------------------

# Congratulations win player

congratulations() {
	clear
	if [ "$PLAYER" == "o" ]; then
		echo "            %%%    %%%            "
		echo
		echo "       %%%              %%%       "
		echo
		echo "   %%%                      %%%   "
		echo
		echo "  %%%                         %%% "
		echo
		echo "  %%%                         %%% "
		echo
		echo "   %%%                        %%% "
		echo
		echo "      %%%                  %%%    "
		echo
		echo "            %%%     %%%           "
	else
		echo "   %%%                      %%%   "
		echo
		echo "       %%%              %%%       "
		echo
		echo "           %%%      %%%           "
		echo
		echo "                %%%               "
		echo
		echo "           %%%      %%%           "
		echo
		echo "       %%%              %%%       "
		echo
		echo "   %%%                      %%%   "
	fi
	exit 0
}

#-------------------------------------------------------------------------------

# Game cicle

while true; do
	print_game_field
	players_turn
	check_win
done

#-------------------------------------------------------------------------------
