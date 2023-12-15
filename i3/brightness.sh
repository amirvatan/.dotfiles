#!/bin/bash
if [[ $1 == "up" ]]
then
    brightnessctl -d nvidia_wmi_ec_backlight s +10% && source /home/amir/.config/polybar/scripts/env.sh

fi
if [[ $1 == "down" ]]
then
    brightnessctl -d nvidia_wmi_ec_backlight s 10%- && source /home/amir/.config/polybar/scripts/env.sh
fi
