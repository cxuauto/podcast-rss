#!/bin/bash

ALBUMID=([0]='2040956' [1]='1837568' [2]='1780124' )
RSSFILE=([0]='lgh.xml' [1]='7890.xml' [2]='fger.xml')
GRABBER="lizhi_linux_amd64"

wget https://github.com/cxuauto/podcast-rss/releases/download/3jia/$GRABBER
chmod +x ./$GRABBER

len=${#ALBUMID[@]}

for ((i=0;i<$len;i++));do
        ./$GRABBER $ALBUMID[$i] > $RSSFILE[$i]
done

ls

for ((i=0;i<$len;i++));do
        curl -X PUT -F c=@$RSSFILE[i] https://ptpb.pw/$PBUUID[i]
done
