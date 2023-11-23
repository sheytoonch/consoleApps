# if read -t 1 input; then
#   echo "$input"
# else
#   echo "no input provided"

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

