#! /bin/bash
ps -axC -o %cpu | awk '{s+=$1} END {print "☷ " "CPU " s "%"}'
