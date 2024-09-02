#!/bin/sh
set -eu
echo ::group::Downloading yt-dlp $version for $RUNNER_OS
mkdir -p yt-dlp
if [ $RUNNER_OS = macOS ]; then binary=yt-dlp_macos; else binary=yt-dlp; fi
if [ "$nightly" = true ]; then repository=yt-dlp-nightly-builds; else repository=yt-dlp; fi
wget -qO yt-dlp/yt-dlp $GITHUB_SERVER_URL/yt-dlp/$repository/releases/download/$version/$binary
chmod +x yt-dlp/yt-dlp
echo ::endgroup::