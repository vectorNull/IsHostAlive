#!/bin/bash

for protocol in 'http://' 'https://'; do
    while read -r line;
    do
        code=$(curl -L --write-out "%{http_code}\n" --output /dev/null --silent --insecure $protocol"$line")
    if [ "$code" = "000" ]; then
        echo "$protocol$line: not responding."
    else    
        echo "$protocol$line: HTTP $code"
        echo "$protocol$line: $code" >> alive.txt
    fi
    done < test.txt  # replace this txt file with the name of the file that contains your domain/ip list

done
