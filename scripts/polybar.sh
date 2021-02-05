#!/usr/bin/env bash
killall polybar

#Find all active monitors
connectedDisplays=$(xrandr | grep -E " connected (primary )?[1-9]+" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
mainMonitor=$(echo $connectedDisplays | awk '{print $1}')
MONITOR=$mainMonitor polybar example &> /dev/null &
secondaryDisplays=$(echo $connectedDisplays | sed 's/ /\n/g' | tail -n +2)
if [ ! -z "$secondaryDisplays" ]; then
    for display in $secondaryDisplays; do
        MONITOR=$display polybar example &> /dev/null &
    done
fi
