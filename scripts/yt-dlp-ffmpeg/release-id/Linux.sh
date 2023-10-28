#!/bin/sh
set -eu
if [ $RUNNER_OS = macOS ]; then echo ::error::yt-dlp/FFmpeg-Builds currently does not have macOS builds, please use AnimMouse/setup-ffmpeg instead. && exit 1; fi
release_id=$(gh api repos/yt-dlp/FFmpeg-Builds/releases/latest -q .id)
echo release_id=$release_id >> $GITHUB_OUTPUT