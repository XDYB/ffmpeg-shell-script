#!/bin/bash

for i in *.mp4; do
	CUTTING=3
	DURATION=`ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 -sexagesimal ${i}`
	SUFFIX=${DURATION##*.}
	END=`gdate -d @$(($(gdate +%s -d ${DURATION})-${CUTTING})) +"%H:%M:%S"`
	ffmpeg -i "$i" -to ${END} -c copy "./new/${i%.*}.mp4" -y
done
