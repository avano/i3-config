#!/usr/bin/env bash

mailspring &

until wmctrl -l | grep "Mailspring" | grep -oE "(0x\w+)"; do sleep 1; done

xprop -id `wmctrl -l | grep "Mailspring" | grep -oE "(0x\w+)"` -f WM_CLASS 8s -set WM_CLASS "ms"
