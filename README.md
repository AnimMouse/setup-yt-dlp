# Setup yt-dlp for GitHub Actions
Setup [yt-dlp](https://github.com/yt-dlp/yt-dlp) (a [youtube-dl](https://github.com/ytdl-org/youtube-dl) fork) on GitHub Actions to use `yt-dlp`.

This action installs [yt-dlp](https://github.com/yt-dlp/yt-dlp) for use in actions by installing it using pip3.

## Usage
To use `yt-dlp`, run this action before `yt-dlp`.

```yml
steps:
  - uses: actions/checkout@v2
    
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v2
    
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

## FFmpeg
To improve yt-dlp's handling of formats, it is recommended to install [FFmpeg](https://ffmpeg.org) by setting `with-ffmpeg` to `true`.

```yml
steps:
  - uses: actions/checkout@v2
    
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v2
    with:
      with-ffmpeg: true
      
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

For Linux, this will install [yt-dlp/FFmpeg-Builds](https://github.com/yt-dlp/FFmpeg-Builds) with some patches necessary for smooth integration with yt-dlp.\
For Windows and MacOS, this will install FFmpeg using [FedericoCarboni/setup-ffmpeg](https://github.com/FedericoCarboni/setup-ffmpeg).

If you already installed FFmpeg in GitHub Runners, no need to set `with-ffmpeg` to `true`.