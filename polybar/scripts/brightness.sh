#!/bin/bash
value=$(brightnessctl -d nvidia_wmi_ec_backlight g)
calc() { awk "BEGIN{print $*}"; }
brightnesspercent="$(calc $value/800*100)"
echo "$brightnesspercent"
