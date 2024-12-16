#!/bin/sh
set -eu
echo ::group::Enabling yt-dlp aria2
mkdir -p ~/.config/yt-dlp
echo "--downloader aria2c" >> ~/.config/yt-dlp/config
echo ::endgroup::