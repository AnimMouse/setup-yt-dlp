#!/bin/sh
set -eu
echo ::group::Signing in to yt-dlp YouTube OAuth
mkdir -p ~/.cache/yt-dlp/youtube
echo "$refresh_token" | base64 -d > ~/.cache/yt-dlp/youtube/oauth_refresh_token_default.json
echo ::endgroup::