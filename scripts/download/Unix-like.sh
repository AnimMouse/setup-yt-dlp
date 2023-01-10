#!/bin/sh
set -eu
echo ::group::Downloading yt-dlp $version for $RUNNER_OS
mkdir yt-dlp
if [ $RUNNER_OS = macOS ]; then binary=yt-dlp_macos; else binary=yt-dlp; fi
aria2c -o yt-dlp/yt-dlp -x 16 -q $GITHUB_SERVER_URL/yt-dlp/yt-dlp/releases/download/$version/$binary
chmod +x yt-dlp/yt-dlp
echo ::endgroup::