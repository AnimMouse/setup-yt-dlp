$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading yt-dlp $env:version for Windows
New-Item yt-dlp -ItemType Directory
aria2c -d yt-dlp -x 16 -q $env:GITHUB_SERVER_URL/yt-dlp/yt-dlp/releases/download/$env:version/yt-dlp.exe
Write-Host ::endgroup::