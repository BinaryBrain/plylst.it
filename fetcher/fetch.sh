DOWNLOAD_DIR="downloads"
FILENAME=`date +%s%N`

youtube-dl -o "$DOWNLOAD_DIR/$FILENAME" $@ &>> /dev/null
OK=$?

if [ $OK -ne 0 ]
then
    exit 1
fi

ffmpeg -i "$DOWNLOAD_DIR/$FILENAME" -vn -acodec libvorbis "$DOWNLOAD_DIR/$FILENAME.ogg" &>> /dev/null
OK=$?
ffmpeg -i "$DOWNLOAD_DIR/$FILENAME" -vn -acodec libmp3lame "$DOWNLOAD_DIR/$FILENAME.mp3" &>> /dev/null
OK=`expr $OK + $?`
rm "$DOWNLOAD_DIR/$FILENAME"

if [ $OK -ne 0 ]
then
    exit 2
fi

echo "$FILENAME"
