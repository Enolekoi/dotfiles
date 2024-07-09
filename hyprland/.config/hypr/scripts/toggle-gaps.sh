#!/usr/bin/env sh
HYPRGAPS=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAPS" = 1 ] ; then
    hyprctl keyword animations:enabled 0; 
    hyprctl --batch "\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    exit
fi
hyprctl reload
