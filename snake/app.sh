# I was using Windows, so I skipped the 1st line "#!/bin/bash".
# Unfortunately I couldn't clear the window in Windows... :(

source settings.sh
source functions.sh

echo -e "Running -- snake -- written in Bash."
echo -e "Move with arrows or WSAD keys.\nEnjoy! :)"
sleep 3

#game_map=$(create_map $map_width $map_height)

move=$(get_user_move "W")
echo $move


# input move arrows or WSAD
# if no input, keep moving in the same direction
