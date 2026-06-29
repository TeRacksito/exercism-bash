#!/usr/bin/env bash

allergies=("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")

score=$(($1 & ((1 << ${#allergies[@]}) - 1)))

mode=$2

if [ $mode = "allergic_to" ]; then
  target=$3
  index=0

  for ((i = 0; i < ${#allergies[@]}; i++)); do
    if [ $target = ${allergies[$i]} ]; then
      index=$i
      break
    fi
  done

  if ((($score >> $index) & 1 == 1)); then
    echo "true"
  else
    echo "false"
  fi
elif [ $mode = "list" ]; then
  index=0
  first=1

  while [ $score -ge 1 ]; do
    if (($score & 1 == 1)); then
      if [ $first -eq 0 ]; then
        printf " "
      fi
      printf '%s' ${allergies[$index]}
      first=0
    fi
    score=$(($score >> 1))
    ((index++))
  done
  printf "\n"
fi
