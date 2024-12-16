#!/bin/sh
set -eu
echo ::group::Enabling yt-dlp YouTube cookies
mkdir -p ~/.config/yt-dlp
echo "--cookies ~/.cache/yt-dlp/youtube/cookies.txt" >> ~/.config/yt-dlp/config
echo ::endgroup::