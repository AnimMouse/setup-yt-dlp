$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading yt-dlp $env:version for Windows
if ($env:nightly -eq 'true') {$repository = "yt-dlp-nightly-builds"} else {$repository = "yt-dlp"}
New-Item yt-dlp -ItemType Directory -Force
Invoke-WebRequest $env:GITHUB_SERVER_URL/yt-dlp/$repository/releases/download/$env:version/yt-dlp.exe -OutFile yt-dlp\yt-dlp.exe
Write-Host ::endgroup::