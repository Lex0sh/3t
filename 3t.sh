#!/bin/bash

# Game Tic-tac-toe

#-------------------------------------------------------------------------------

# Print game field

print_game_field() {
	clear
	echo "  1 2 3 "
	echo " -------"
	echo "1|${MATRIX[1]}|${MATRIX[2]}|${MATRIX[3]}|"
	echo " -------"
	echo "2|${MATRIX[4]}|${MATRIX[5]}|${MATRIX[6]}|"
	echo " -------"
	echo "3|${MATRIX[7]}|${MATRIX[8]}|${MATRIX[9]}|"
	echo " -------"
}

#-------------------------------------------------------------------------------

# Enter row and collumn

enter_row_column() {
	echo
	echo "\"$PLAYER\" player's turn"
	read -n 1 -p "Enter row: " row
	echo
	read -n 1 -p "Enter collumn: " collumn
	
	if [[ "$row" != [0-9] || "$collumn" != [0-9] ]]; then
		echo
		echo "!!! Enter the number, not a letter !!!"
		enter_row_column
	elif [[ "$row" > 3 || "$collumn" > 3 ]]; then
		echo
		echo "!!! The number must be less or equal than to 3 !!!"
		enter_row_column
	fi
}

#-------------------------------------------------------------------------------

# Checking if the square is occupied

check_square_occupied() {
	if [ "${MATRIX[$square]}" == " " ]; then
		MATRIX[$square]="$PLAYER"
	else
		echo; echo; echo "!!! The square is already occupied !!!"
		if [ $PLAYER == 'o' ]; then
			PLAYER='x'
		else
			PLAYER='o'
		fi
		players_turn
	fi
}

#-------------------------------------------------------------------------------

# Player's turn

players_turn() {
	if [ $PLAYER == 'o' ]; then
		PLAYER='x'
	else
		PLAYER='o'
	fi
	
	enter_row_column
		
	if [ $row -eq '1' ]; then
		if [ $collumn -eq '1' ]; then
			square="1"
			check_square_occupied
		elif [ $collumn -eq '2' ]; then
			square="2"
			check_square_occupied
		else
			square="3"
			check_square_occupied
		fi
	elif [ $row -eq '2' ]; then
		if [ $collumn -eq '1' ]; then
			square="4"
			check_square_occupied
		elif [ $collumn -eq '2' ]; then
			square="5"
			check_square_occupied
		else
			square="6"
			check_square_occupied
		fi
	else
		if [ $collumn -eq '1' ]; then
			square="7"
			check_square_occupied
		elif [ $collumn -eq '2' ]; then
			square="8"
			check_square_occupied
		else
			square="9"
			check_square_occupied
		fi
	fi
}

#-------------------------------------------------------------------------------

# Checking the winning player

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

# Congratulations the winning player

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
		echo
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
		echo
	fi
	
	read -n 1 -p "Do you want play again? (y/n)):" answer
	if [ "$answer" == "y" ]; then
		human_game_cycle
	else
		echo
		exit 0
	fi
}

#-------------------------------------------------------------------------------

# Game for two players

human_game_cycle() {
	PLAYER='o'
	declare -a MATRIX=( [1]=' ' [2]=' ' [3]=' ' \
						[4]=' ' [5]=' ' [6]=' ' \
						[7]=' ' [8]=' ' [9]=' ' )

	while true; do
		print_game_field
		players_turn
		check_win
	done
}

#-------------------------------------------------------------------------------

human_game_cycle

#-------------------------------------------------------------------------------
