
#Dump1090
Target[nw_dump1090_aircraft]: `bash /etc/mrtg/dump1090-plane-count.sh`
Title[nw_dump1090_aircraft]: Dump1090 aircraft seen
MaxBytes[nw_dump1090_aircraft]: 500
Options[nw_dump1090_aircraft]: integer,nopercent,growright,unknaszero,nopercent,gauge,noinfo,nobanner,withzeroes
YLegend[nw_dump1090_aircraft]: aircraft
ShortLegend[nw_dump1090_aircraft]:
LegendI[nw_dump1090_aircraft]: valid aircraft with positions seen: &nbsp;
LegendO[nw_dump1090_aircraft]: invalid aircraft without positions seen: &nbsp;
kMG[nw_dump1090_aircraft]: ,
PageTop[nw_dump1090_aircraft]: <H1>Dump1090 aircraft seen</H1>

Target[nw_dump1090_messages]: `bash /etc/mrtg/dump1090-message-distance-count.sh`
Title[nw_dump1090_messages]: Dump1090 messages/distance
MaxBytes[nw_dump1090_messages]: 500
Options[nw_dump1090_messages]: integer,nopercent,growright,unknaszero,nopercent,gauge,noinfo,nobanner,withzeroes
YLegend[nw_dump1090_messages]: messages-Miles
ShortLegend[nw_dump1090_messages]:
LegendI[nw_dump1090_messages]: messages/second:
LegendO[nw_dump1090_messages]: Distance (nmiles):
kMG[nw_dump1090_messages]: ,
PageTop[nw_dump1090_messages]: <H1>Dump1090 messages/distance</H1>
