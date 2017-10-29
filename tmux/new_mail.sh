#!/bin/sh

account="$1"
count=$(ls Mail/$account/INBOX/new | wc -l)

#if [[ -n "$count"  && "$count" -gt 0 ]]; then
  echo "${count}"
  #echo "✉ ${count} "
#fi
