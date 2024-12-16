#!/bin/sh
set -eu
echo ::group::Signing in to yt-dlp YouTube using cookies
mkdir -p ~/.cache/yt-dlp/youtube
echo "$cookies" | base64 -d > ~/.cache/yt-dlp/youtube/cookies.txt
echo ::endgroup::