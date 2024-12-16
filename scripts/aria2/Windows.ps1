$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Enabling yt-dlp aria2
New-Item $env:APPDATA\yt-dlp -ItemType Directory -Force
Add-Content $env:APPDATA\yt-dlp\config "--downloader aria2c"
Write-Host ::endgroup::