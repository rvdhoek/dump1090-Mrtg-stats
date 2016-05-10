#!/bin/sh
#Count plane's messanges and distance dump1090 which has a handy JSON output

hostdump1090="localhost"
port="8080"

#Local gps location
Latitude="51.70896"
Longitude="4.705"

deg2rad () {
        bc -l <<< "$1 * 0.0174532925"
}

rad2deg () {
        bc -l <<< "$1 * 57.2957795"
}

acos () {
        pi="3.141592653589793"
        bc -l <<<"$pi / 2 - a($1 / sqrt(1 - $1 * $1))"
}


output=$(curl -s  $hostdump1090":"$port"/data.json")
# All messages counter
counter=$(echo "$output" | grep -o  'messages'| wc -l)
if [ -n "$counter" ]; then echo $counter; else echo UNKNOWN; fi

# Now we do distance calulation
lat=$(grep -o -P '(?<="lat":).*(?=, "lon":)' <<< "$output" )
latarray=(${lat// / })

lon=$(grep -o -P '(?<="lon":).*(?=, "validposition":)' <<< "$output" )
lonarray=(${lon// / })

# get length of an array
latarraylength=${#latarray[@]}
lonarraylength=${#lonarray[@]}

#echo $lon
#echo $lat

if [ "$latarraylength" != "$lonarraylength" ]; then echo "No correct lat/lon (script error)"
fi

# use for loop to read all values
for (( i=0; i<${latarraylength}; i++ ));
do
  if [ ${latarray[$i]} != "0.000000" ] || [ ${lonarray[$i]} != "0.000000" ]; then
        lat_1=$Latitude
        lon_1=$Longitude
        lat_2=${latarray[$i]} 
        lon_2=${lonarray[$i]}
        delta_lat=`bc <<<"$lat_2 - $lat_1"`
        delta_lon=`bc <<<"$lon_2 - $lon_1"`
        lat_1="`deg2rad $lat_1`"
        lon_1="`deg2rad $lon_1`"
        lat_2="`deg2rad $lat_2`"
        lon_2="`deg2rad $lon_2`"
        delta_lat="`deg2rad $delta_lat`"
        delta_lon="`deg2rad $delta_lon`"
        distance=`bc -l <<< "s($lat_1) * s($lat_2) + c($lat_1) * c($lat_2) * c($delta_lon)"`
        distance=`acos $distance`           
        distance="`rad2deg $distance`"
        distance=`bc -l <<< "$distance * 60 * 1.15078"`
        distance=`bc <<<"scale=4; $distance / 1"`
        distarray=("${distarray[@]}" $distance)
  fi
#echo $distance
done

#If no planes, echo 0
if [ ${#distarray[@]} -eq 0 ]; then echo "0"
else {
IFS=$'\n'
#Longest distance in miles
echo "${distarray[*]}" | sort -nr | head -n1
}
fi








