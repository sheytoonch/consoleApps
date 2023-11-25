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


create_game_map() {
    declare -a mapArray

    for ((y=0; y<$map_height; y++)); do
        for((x=0; x<$map_width; x++)); do
            arrayIndex=$((y * $map_width + x))
            bottomEdge=$((y * $map_width))

            if [ y -eq 0 ] || [ y -eq $((y * $map_width)) ] || [ x -eq 0 ] || [ x -eq $((x * $map_height)) ]; then
                mapArray[$arrayIndex]="X"
            else
                mapArray[$arrayIndex]="O"
            fi
        done
    done

    echo "${mapArray[@]}"
}