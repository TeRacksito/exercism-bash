#!/usr/bin/env bash

original_number=$1
number=$1
digits=${#number}
total=0

while [ $number -ge 1 ]; do
  total=$((($number % 10) ** $digits + $total))
  number=$(($number / 10))
done

[[ $original_number -eq $total ]] && echo "true" || echo "false"
