#!/bin/sh
set -eu
echo ::group::Signing in to yt-dlp-youtube-oauth2
mkdir -p ~/.cache/yt-dlp/youtube-oauth2
echo "$token_data" | base64 -d > ~/.cache/yt-dlp/youtube-oauth2/token_data.json
echo ::endgroup::