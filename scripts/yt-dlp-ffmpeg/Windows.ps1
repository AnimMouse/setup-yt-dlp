$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading latest yt-dlp/FFmpeg-Builds for Windows
Invoke-WebRequest $env:GITHUB_SERVER_URL/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -OutFile ffmpeg-master-latest-win64-gpl.zip
Expand-Archive ffmpeg-master-latest-win64-gpl.zip yt-dlp-FFmpeg
Move-Item yt-dlp-FFmpeg\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe, yt-dlp-FFmpeg\ffmpeg-master-latest-win64-gpl\bin\ffplay.exe yt-dlp-FFmpeg
Remove-Item ffmpeg-master-latest-win64-gpl.zip, yt-dlp-FFmpeg\ffmpeg-master-latest-win64-gpl -Recurse
Write-Host ::endgroup::