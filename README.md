# dump1090-Mrtg-stats

![alt tag](https://github.com/rvdhoek/dump1090-Mrtg-stats/blob/master/Printscreen.png)

Intallation (for existing mrtg installation)
-----------
```
copy dump1090-plane-count.sh to folder /etc/mrtg
copy dump1090-message-distance-count.sh to folder /etc/mrtg
copy raspi-2.inc to raspi-2.inc to folder /etc/mrtg
edit dump1090-message-distance-count.sh
Latitude="xx.xxxxx"
Longitude="x.xxx"

Add a new line to the end of the mrtg.cfg file: Include: /etc/mrtg/raspi-2.inc  
Run: indexmaker /etc/mrtg/mrtg.cfg > /var/www/mrtg/index.html

(service mrtg restart)

