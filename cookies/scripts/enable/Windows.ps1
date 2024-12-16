$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Enabling yt-dlp YouTube cookies
New-Item $env:APPDATA\yt-dlp -ItemType Directory -Force
Add-Content $env:APPDATA\yt-dlp\config "--cookies ~/.cache/yt-dlp/youtube/cookies.txt"
Write-Host ::endgroup::