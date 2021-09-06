# video-gif-converter
BASH script to convert MP4 files to GIFs in bulk using FFmpeg.

# Dependancies
This script uses FFmpeg make sure `ffmpeg` package is installed before executing the script.

# How to use
* Execute the script
```
	$ ./video-gif-converter.sh
```

* Enter the videos' directory path
```
	$ /home/user/Desktop/Videos\ to\ be\ converted/
	or
	$ ../Videos\ to\ be\ converted/
```

Or you can pass the path to the script as an argument

```
	$ ./video-gif-converter.sh <Videos Directory Path>
```

# Note:
###### The script was made for a specific set of videos with a certain resolution it may not work with all videos and it will need editing to the cropping and scaling values.

# To Do
* [ ] Making the cropping and scaling values into variables. 
* [ ] Adding proper error handling.
