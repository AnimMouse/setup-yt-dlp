$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
$release_id = (gh api repos/yt-dlp/FFmpeg-Builds/releases/latest -q .id)
Add-Content $env:GITHUB_OUTPUT release_id=$release_id