#!/bin/bash

connected=$(bluetoothctl info $1 | grep "Connected" | cut -d ' ' -f2)
percent_central=$(python3 $2 $1 | grep 'Central' | cut -d ' ' -f3)
percent_periperal=$(python3 $2 $1 | grep 'Peripheral' | cut -d ' ' -f4)

if [[ $connected == "yes" ]]; then
  if [ -z "$percent_central" ]; then
    echo "?"
  else
    echo "$percent_central%|$percent_periperal%"
  fi
elif [[ $connected == "no" ]]; then
  echo "off"
else
  echo "?"
fi