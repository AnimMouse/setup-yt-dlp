#!/bin/sh
set -eu
echo ::group::Downloading latest yt-dlp/FFmpeg-Builds for Linux
aria2c -x 16 -q $GITHUB_SERVER_URL/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz
tar -xf ffmpeg-master-latest-linux64-gpl.tar.xz --strip-components 2 --no-anchored ffmpeg ffprobe
mkdir yt-dlp-ffmpeg
mv ffmpeg ffprobe yt-dlp-ffmpeg
rm ffmpeg-master-latest-linux64-gpl.tar.xz
echo ::endgroup::