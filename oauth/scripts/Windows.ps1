$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Signing in to yt-dlp YouTube OAuth
New-Item $env:USERPROFILE\.cache\yt-dlp\youtube -ItemType Directory -Force
$refresh_token = [Convert]::FromBase64String($env:refresh_token)
[IO.File]::WriteAllBytes("$env:USERPROFILE\.cache\yt-dlp\youtube\oauth_refresh_token_default.json", $refresh_token)
Write-Host ::endgroup::