#!/bin/bash
HOST='ftp.shobhitk.uwebweb.com'
USER='shobhitk'
PASSWD='cardetect'
LASTOUTPUT=''

while :
do
        ./motione.py &
        output="$(ls -t ./images|head -n1 )"
if [ "$output" != "$lastoutput" ]; then 
        echo "images/${output}"

	python3 main.py --image images/${output} --yolo yolo-coco 
        
	txtfile="$(echo ${output} | tr 'jpg' 'txt')"
	echo "${txtfile}"
ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
binary
put ./output/${output}
put ./output/${txtfile}
quit
END_SCRIPT
fi
LASTOUTPUT=$output
	echo "Press [CTRL+C] to stop..Image Capture and Processing Working"
	sleep 1
done
