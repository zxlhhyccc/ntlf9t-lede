#!/bin/sh
/etc/init.d/aria2 stop
list=`curl -s https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ip.txt |awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "option bt_tracker " /etc/config/aria2`" ]; then
    sed -i "$a option bt_tracker '"${list}"'" /etc/config/aria2
    echo add......
else
    sed -i "s@option bt_tracker .*@option bt_tracker '$list'@g" /etc/config/aria2
    echo update......
fi
/etc/init.d/aria2 start