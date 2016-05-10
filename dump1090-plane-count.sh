#!/bin/sh
#Count plane's dump1090 which has a handy JSON output

hostdump1090="localhost"
port="8080"

output=$(curl -s  $hostdump1090":"$port"/data.json")
countvalid=$(echo "$output" | grep '"validposition":1' | wc -l)
countinvalid=$(echo "$output" | grep '"validposition":0' | wc -l)

echo $countvalid
echo $countinvalid
