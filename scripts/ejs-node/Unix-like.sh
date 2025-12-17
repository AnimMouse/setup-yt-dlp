#!/bin/sh
set -eu
echo ::group::Enabling yt-dlp EJS Node
mkdir -p ~/.config/yt-dlp
echo "--js-runtimes node" >> ~/.config/yt-dlp/config
echo ::endgroup::