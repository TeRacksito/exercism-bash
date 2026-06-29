#!/usr/bin/env bash

main() {
  local input="$1"
  local reversed=""

  for ((i = ${#input} - 1; i >= 0; i--)); do
    reversed+="${input:$i:1}"
  done

  echo "$reversed"
}

main "$@"
