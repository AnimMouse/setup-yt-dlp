#!/bin/sh
echo ::group::Downloading latest yt-dlp/FFmpeg-Builds for Linux
curl -s https://api.github.com/repos/yt-dlp/FFmpeg-Builds/releases/latest \
| grep "browser_download_url.*linux64-gpl-*.tar.xz" \
| cut -d : -f 2,3 \
| tr -d \" \
| aria2c -x 16 -o ffmpeg-yt-dlp-linux64-gpl.tar.xz $(cat)
tar -xf ffmpeg-yt-dlp-linux64-gpl.tar.xz --strip-components 2 --no-anchored ffmpeg
mkdir yt-dlp-ffmpeg
mv ffmpeg ./yt-dlp-ffmpeg/
rm ffmpeg-yt-dlp-linux64-gpl.tar.xz
echo ::endgroup::