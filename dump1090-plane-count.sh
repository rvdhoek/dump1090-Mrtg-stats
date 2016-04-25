
#!/bin/sh
#Count plane's dump1090 which has a handy JSON output

output=$(curl -s localhost:8080/data.json)
countvalid=$(echo "$output" | grep '"validposition":1' | wc -l)
countinvalid=$(echo "$output" | grep '"validposition":0' | wc -l)

echo $countvalid
echo $countinvalid
