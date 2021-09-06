#!/bin/bash

#Videos path
if [[ "$1" == "" ]]
then
    read -re -p "Enter the absolute path of the videos' directory as written (Example: /home/user/Desktop/Videos\ to\ be\ converted/): " vdir
else
    #Set path
    vdir="$1";
fi

#Change directory to videos path
cd "$vdir"

#Handle spaces in names
#Preserve IFS variable
IFS_BACKUP=$IFS
IFS=$(echo -en "\n\b")
#IFS=$(echo -en "\n\r")

#Loop over videos
for fvid in *.mp4
do
    ffmpeg -i "$fvid" -filter_complex "crop=iw-900" "${fvid}_cropped.mp4"
    ffmpeg -i "${fvid}_cropped.mp4" -vf scale=210x210:flags=lanczos -c:v libx264 -preset slow -crf 21 "${fvid}_scaled.mp4"
    rm "${fvid}_cropped.mp4"
    ffmpeg -y -i "${fvid}_scaled.mp4" -vf fps=10,scale=210:-1:flags=lanczos,palettegen "${fvid}_palette.png"
    ffmpeg -i "${fvid}_scaled.mp4" -i "${fvid}_palette.png" -filter_complex "fps=10,scale=210:-1:flags=lanczos[x];[x][1:v]paletteuse" "${fvid}.gif"
    rm "${fvid}_scaled.mp4" "${fvid}_palette.png"
done

#Preserve IFS variable
IFS=$IFS_BACKUP
