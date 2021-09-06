ffmpeg -i input.mp4 -filter_complex "crop=iw-900" input_cropped.mp4
ffmpeg -i input_cropped.mp4 -vf scale=210x210:flags=lanczos -c:v libx264 -preset slow -crf 21 scaled_input.mp4
ffmpeg -y -i scaled_input.mp4 -vf fps=10,scale=210:-1:flags=lanczos,palettegen palette.png
ffmpeg -i scaled_input.mp4 -i palette.png -filter_complex "fps=10,scale=210:-1:flags=lanczos[x];[x][1:v]paletteuse" output.gif
