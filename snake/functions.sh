source settings.sh


# Previous move is the argument
get_user_move() {
    direction=$1

    # -s (read in silent mode), -t seconds (time), -n amount (number of characters to capture)
    if read -s -t $game_ticks -n 1 clicked_button; then
        case "$clicked_button" in
            "w" | "W") direction="W" ;;
            "s" | "S") direction="S" ;;
            "a" | "A") direction="A" ;;
            "d" | "D") direction="D" ;;
            *)  ;;
        esac
    else
        direction=$1
    fi

    echo $direction
}


# Arguments are width and height
initiate_game_board() {
    local game_board=()
    for((row = 0; row < $2; row++)); do
        for((column = 0; column < $1; column++)); do
            index=$((row * $1 + column))

            if [ $row -eq 0 ] || [ $row -eq $(($2 - 1)) ] || [ $column -eq 0 ] || [ $column -eq $(($1 - 1)) ]; then
                game_board[index]="BOARD"
            else
                game_board[index]="0" # 0 is FIELD
            fi
        done
    done

    game_board[$(( $head_position_x * $1 + $head_position_y ))]="H"

    echo "${game_board[@]}"
}


render_board() {
    local game_board=("$@")
    local rendered_board=()
    index=0

    for element in "${game_board[@]}"; do
        if [[ $element == "BOARD" ]]; then
            rendered_board[index]=$map_border_sign
        elif [[ $element == "HEAD" ]]; then

        ((index++))
    done

    echo "${game_board[@]}"
}

