source settings.sh


get_user_move() {
    # Previous move is the argument
    direction=$1

    # -s (read in silent mode), -t seconds (time), -n amount (number of characters to capture)
    if read -s -t $game_tick -n 1 clicked_button; then
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

            if [ $row -eq 0 ] || [ $row -eq $(( $2 - 1 )) ] || [ $column -eq 0 ] || [ $column -eq $(( $1 - 1 )) ]; then
                game_board[index]=$map_border_sign
            else
                game_board[index]=$map_field_sign
            fi
        done
    done

    echo "${game_board[@]}"
}