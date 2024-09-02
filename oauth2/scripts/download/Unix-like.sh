#!/bin/sh
set -eu
echo ::group::Downloading and installing yt-dlp-youtube-oauth2 $version
mkdir -p ~/.config/yt-dlp/plugins
wget -qP ~/.config/yt-dlp/plugins $GITHUB_SERVER_URL/coletdjnz/yt-dlp-youtube-oauth2/releases/download/$version/yt-dlp-youtube-oauth2.zip
echo ::endgroup::