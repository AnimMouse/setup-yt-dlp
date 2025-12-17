$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Enabling yt-dlp EJS Node
New-Item $env:APPDATA\yt-dlp -ItemType Directory -Force
Add-Content $env:APPDATA\yt-dlp\config "--js-runtimes node"
Write-Host ::endgroup::