$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
if ($env:version -eq 'latest') {
  if ($env:nightly -eq 'true') {
    $latest_version = (gh api repos/yt-dlp/yt-dlp-nightly-builds/releases/latest -q .tag_name)
  }
  else {
    $latest_version = (gh api repos/yt-dlp/yt-dlp/releases/latest -q .tag_name)
  }
  Add-Content $env:GITHUB_OUTPUT version=$latest_version
}
else {
  Add-Content $env:GITHUB_OUTPUT version=$env:version
}