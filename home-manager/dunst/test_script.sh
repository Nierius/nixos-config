#!/bin/sh

pkill dunst
dunst &
notify-send -u low "Low" "Low emergency"
notify-send -u normal "Medium" "Medium emergency"
notify-send -u critical "High" "High emergency"
notify-send "Default" "Default emergency"
