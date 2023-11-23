# I was using Windows, so I skipped the 1st line "#!/bin/bash".
# Unfortunately I couldn't clear the window in Windows...

# Game settings
map_width=10
map_height=7
map_border_sign="#"
map_field_sigh=" "

apple_sign="■"

snake_head_sign="0"
snake_body_sign="O"

echo -e "Running -- snake -- written in Bash."
echo -e "Move with arrows or WSAD keys.\nEnjoy! :)"
sleep 1



# if read -t 1 input; then
#   echo "$input"
# else
#   echo "no input provided"