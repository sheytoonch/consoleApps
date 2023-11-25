# I was using Windows, so I skipped the 1st line "#!/bin/bash".
# Unfortunately I couldn't clear the window in Windows... :(

source settings.sh
source functions.sh

is_game_finished="FALSE"

echo -e "Running -- snake -- written in Bash."
echo -e "Move with arrows or WSAD keys.\nEnjoy! :)"
sleep 0

#################################################################
### Generate empty map with borders

initiated_game_board=$(initiate_game_board $map_width $map_height)
# Read from variable and split into array
read -ra game_board <<< "$initiated_game_board"


################################################################# - delete later
### Temporary draw function

rendered_board=$(render_board "${game_board[@]}")
read -ra board_to_print <<< "$rendered_board"

for((row=0; row<$map_height; row++)); do
    for((column=0; column<$map_width; column++)); do
        index=$((row * $map_width + column))
        echo -n "${board_to_print[index]} "
    done
    echo
done


while [ $is_game_finished != "TRUE" ]; do
    echo "BEGINNING OF WHILE"
    # WSAD or keep going towards previous direction
    direction=$(get_user_move $direction)
    echo $direction

    echo "END OF WHILE"
    is_game_finished="TRUE"
done


echo "END OF SNAKE"

# check if eats apple
# check if can move
# check if won't hit itself
# check if wall