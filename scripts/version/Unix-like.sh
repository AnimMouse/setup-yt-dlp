#!/bin/sh
set -eu
if [ "$version" = latest ]
then
  if [ "$nightly" = true ]
  then
    latest_version=$(gh api repos/yt-dlp/yt-dlp-nightly-builds/releases/latest -q .tag_name)
  else
    latest_version=$(gh api repos/yt-dlp/yt-dlp/releases/latest -q .tag_name)
  fi
  echo "version=$latest_version" >> $GITHUB_OUTPUT
else
  echo "version=$version" >> $GITHUB_OUTPUT
fi