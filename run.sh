#!/bin/bash

while :
do
        python2 motione.py &
        output="$(ls -t ./images|head -n1 )"
if [ "$output" != "$lastoutput" ]; then 
        echo "images/${output}"

	python3 yolo.py --image images/${output} --yolo yolo-coco 
        
	txtfile="$(echo ${output} | tr 'jpg' 'txt')"
	echo "${txtfile}"
        python3 uploadto_s3.py  images/${output}
        python3 uploadto_s3.py  images/${txtfile}
fi
LASTOUTPUT=$output
	echo "Press [CTRL+C] to stop..Image Capture and Processing Working"
	sleep 1
done
