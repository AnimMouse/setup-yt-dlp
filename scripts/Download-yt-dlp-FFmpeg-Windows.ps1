Write-Host ::group::Downloading latest yt-dlp/FFmpeg-Builds for Windows
aria2c -x 16 https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip
7z e ffmpeg-master-latest-win64-gpl.zip ffmpeg.exe ffprobe.exe -oyt-dlp-ffmpeg -r
Remove-Item ffmpeg-master-latest-win64-gpl.zip
Write-Host ::endgroup::