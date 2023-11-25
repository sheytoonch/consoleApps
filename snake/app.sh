# I was using Windows, so I skipped the 1st line "#!/bin/bash".
# Unfortunately I couldn't clear the window in Windows... :(

source settings.sh
source functions.sh

is_game_finished="FALSE"

echo -e "Running -- snake -- written in Bash."
echo -e "Move with arrows or WSAD keys.\nEnjoy! :)"
sleep 0


#game_map=$(create_game_map $map_width $map_height)
# place apple

initiated_game_board=$(initiate_game_board $map_width $map_height)
IFS=" " read -ra game_board <<< "$initiated_game_board" # read from variable

for((row=0; row<$map_height; row++)); do
    for((column=0; column<$map_width; column++)); do
        index=$((row * $map_width + column))
        echo -n "${game_board[index]} "
    done
    echo
done

echo "end"
exit 0

while [ $is_game_finished != "TRUE" ]; do
    # WSAD or keep going towards previous direction
    direction=$(get_user_move $direction)
    echo $direction

done


# check if eats apple
# check if can move
# check if won't hit itself
# check if wall