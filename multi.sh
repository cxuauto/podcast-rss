#!/bin/bash

ALBUMID=('2040956' '1837568' '1780124' )
RSSFILE=('lgh.xml' '7890.xml' 'fger.xml')
GRABBER="lizhi_linux_amd64"

wget https://github.com/cxuauto/podcast-rss/releases/download/3jia/$GRABBER
chmod +x ./$GRABBER

len=${#ALBUMID[@]}

for ((i=0;i<$len;i++));do
        ./$GRABBER $ALBUMID[$i] > $RSSFILE[$i]
done

ls

for ((i=0;i<$len;i++));do
        curl -X PUT -F c=@$RSSFILE[i] https://ptpb.pw/$PBUUID$i
done
