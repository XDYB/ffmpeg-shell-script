#!/bin/bash

for i in *.mp4; do ffmpeg -i "$i" -filter:v "crop=in_w/1.2:in_h-210" -c:a copy "./new/${i%.*}.mp4"; done
