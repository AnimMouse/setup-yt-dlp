#!/bin/sh
set -eu
echo ::group::Downloading latest yt-dlp/FFmpeg-Builds for Linux
if [ $RUNNER_OS = macOS ]; then echo ::error::yt-dlp/FFmpeg-Builds currently does not have macOS builds, please use AnimMouse/setup-ffmpeg instead. && exit 1; fi
mkdir -p yt-dlp-FFmpeg
wget -qO- $GITHUB_SERVER_URL/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz | tar -xJC yt-dlp-FFmpeg --strip-components 2 --no-anchored ffmpeg ffprobe
echo ::endgroup::