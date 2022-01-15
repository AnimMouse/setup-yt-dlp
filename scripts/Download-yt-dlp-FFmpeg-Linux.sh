#!/bin/sh
echo ::group::Downloading latest yt-dlp/FFmpeg-Builds for Linux
aria2c -x 16 https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz
tar -xf ffmpeg-master-latest-linux64-gpl.tar.xz --strip-components 2 --no-anchored ffmpeg
mkdir yt-dlp-ffmpeg
mv ffmpeg ./yt-dlp-ffmpeg/
rm ffmpeg-master-latest-linux64-gpl.tar.xz
echo ::endgroup::