#!/bin/bash

zen_mode_state_file="/tmp/.yabai_zen_mode_status"
query_space=$(yabai -m query --spaces --space)
zen_mode_setting=${YABAI_ZEN_MODE:-"off"}
current_zen_mode_state=$(cat $zen_mode_state_file  2> /dev/null || echo "$zen_mode_setting")


next_mode=""
if [ "$current_zen_mode_state" == "off" ]; then
#	echo "on" >| $zen_mode_state_file
	next_mode="on"
elif [ "$current_zen_mode_state" == "on" ]; then
	next_mode="off"
fi
# Save state
echo "$next_mode" >| $zen_mode_state_file

yabai -m space --toggle padding && yabai -m space --toggle gap



