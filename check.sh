#!/bin/bash

echo "" > result.log
while read line
do
  echo "check $line..."
  # check site alive
  curl -s --max-time 5 $line > /dev/null
  if [ $? -ne 0 ]; then
    continue
  fi

  # check tls1.2 connection
  curl -s --tlsv1.2 --max-time 5 $line > /dev/null
  if [ $? -ne 0 ]; then
    echo "$line tls1.2 error!" >> result.log
  fi
done < list.txt

