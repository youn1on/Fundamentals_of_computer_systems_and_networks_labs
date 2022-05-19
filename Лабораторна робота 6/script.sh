#!/bin/bash

mostPopularHost=$(cat $1 | awk '{split($0, a, " - - "); print a[1]}' | sort | uniq -c | sort -rn | head -1)
callsNumber=$(echo $mostPopularHost | awk '{print $1}')
hostName=$(echo $mostPopularHost | awk '{print $2}')
cat $1 | grep $hostName | awk '{split($0, a, "\""); print a[2]}' | awk '{print $2}' | sort | uniq -c | sort -rn | head -10 | awk '{printf "http://%s%s - %d - %d%%\n", "'$hostName'", $2, $1, $1/'$callsNumber'*100 }'
