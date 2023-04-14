$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading yt-dlp $env:version for Windows
New-Item yt-dlp -ItemType Directory -Force
Invoke-WebRequest $env:GITHUB_SERVER_URL/yt-dlp/yt-dlp/releases/download/$env:version/yt-dlp.exe -OutFile yt-dlp\yt-dlp.exe
Write-Host ::endgroup::