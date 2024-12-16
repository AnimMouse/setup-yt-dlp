$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Signing in to yt-dlp YouTube using cookies
New-Item $env:USERPROFILE\.cache\yt-dlp\youtube -ItemType Directory -Force
$cookies = [Convert]::FromBase64String($env:cookies)
[IO.File]::WriteAllBytes("$env:USERPROFILE\.cache\yt-dlp\youtube\cookies.txt", $cookies)
Write-Host ::endgroup::