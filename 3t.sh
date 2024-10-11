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

# Human enter row and collumn

human_enter() {
	echo
	echo "\"$PLAYER\" player's turn"
	read -n 1 -p "Enter row: " row
	echo
	read -n 1 -p "Enter collumn: " collumn
	
	if [[ "$row" != [0-9] || "$collumn" != [0-9] ]]; then
		echo; echo "!!! Enter the number, not a letter !!!"
		human_enter
	elif [[ "$row" > 3 || "$collumn" > 3 ]]; then
		echo; echo "!!! The number must be less or equal than to 3 !!!"
		human_enter
	fi
}

#-------------------------------------------------------------------------------

# Very simple computer player

computer_enter() {
	index=1
	declare -a V_MOVE=([1]="1|1" [2]="1|2" [3]="1|3" \
						[4]="2|1" [5]="2|2" [6]="2|3" \
						[7]="3|1" [8]="3|2" [9]="3|3")
	unset open_square
	for i in {1..9}; do
		if [[ "${MATRIX[$i]}" == " " ]]; then
			open_square[$index]=$i
			let "index +=1"
		fi
	done
	computer_move=${open_square[$(shuf -i 1-${#open_square[@]} -n 1)]}
	row=$(echo ${V_MOVE[$computer_move]} | cut -d "|" -f 1)
	collumn=$(echo ${V_MOVE[$computer_move]} | cut -d "|" -f 2)
}

#-------------------------------------------------------------------------------

# Checking if the square is occupied

check_square_occupied() {
	if [ "${MATRIX[$square]}" == " " ]; then
		MATRIX[$square]="$PLAYER"
	else
		if [ "$PLAYER" == "x" ]; then
			echo; echo; echo "!!! The square is already occupied !!!"
		fi
		if [ $PLAYER == 'o' ]; then
			PLAYER='x'
		else
			PLAYER='o'
		fi
		main_game
	fi
}

#-------------------------------------------------------------------------------

# Game

main_game() {
	if [ $PLAYER == 'o' ]; then
		PLAYER='x'
	else
		PLAYER='o'
	fi
	
	if [[ "$second_player" == "computer" && "$PLAYER" == "o" ]]; then
		computer_enter
	else
		human_enter
	fi
		
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
	# Counting occupied square
	unset draw[@]
	index1=0
	for q in {1..9}; do
		if [[ "${MATRIX[$q]}" != " " ]]; then
			draw[$index1]=$q
			let "index1 +=1"
		fi
	done

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
	elif [[ "${#draw[@]}" == '9' ]]; then
		echo; echo; echo "Draw in the game!"
		echo; read -n 1 -p "Do you want play again? (y/n)):" answer
		if [ "$answer" == "y" ]; then
			game_cycle
		else
			echo
			exit 0
		fi

	fi
}

#-------------------------------------------------------------------------------

# Congratulations the winning player

congratulations() {
	clear
	echo "  1 2 3 "
	echo " -------"
	echo "1|${MATRIX[1]}|${MATRIX[2]}|${MATRIX[3]}|"
	echo " -------"
	echo "2|${MATRIX[4]}|${MATRIX[5]}|${MATRIX[6]}|"
	echo " -------"
	echo "3|${MATRIX[7]}|${MATRIX[8]}|${MATRIX[9]}|"
	echo " -------"

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
	elif [ "$PLAYER" == "x" ]; then
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
		game_cycle
	else
		echo
		exit 0
	fi
}

#-------------------------------------------------------------------------------

# Game cycle

game_cycle() {
	clear
	echo "Do you want to play with a human or a computer?"
	echo
	echo "1 - Human"
	echo "2 - Computer"
	echo; read -s -n 1 human_or_computer
	case $human_or_computer in
		1)	second_player='human';;
		2)	second_player='computer';;
		*)	echo "!!! You can choose only 1 or 2 !!!" && sleep 1 && game_cycle;;
	esac

	PLAYER='o'
	declare -a MATRIX=( [1]=' ' [2]=' ' [3]=' ' \
						[4]=' ' [5]=' ' [6]=' ' \
						[7]=' ' [8]=' ' [9]=' ' )

	while true; do
		print_game_field
		main_game
		check_win
	done
}

#-------------------------------------------------------------------------------

game_cycle

#-------------------------------------------------------------------------------
