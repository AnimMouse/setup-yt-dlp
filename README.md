# Setup yt-dlp for GitHub Actions
Setup [yt-dlp](https://github.com/yt-dlp/yt-dlp) (a [youtube-dl](https://github.com/ytdl-org/youtube-dl) fork) on GitHub Actions to use `yt-dlp`.

This action installs [yt-dlp](https://github.com/yt-dlp/yt-dlp) for use in actions by installing it using pip3.

This action only works on Ubuntu virtual environments as [conditionals](https://github.com/actions/runner/issues/646) does not work on [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-run-steps-action) yet.

## Usage
To use `yt-dlp`, run this action before `yt-dlp`.

```yml
steps:
  - uses: actions/checkout@v2
    
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

## FFmpeg
To improve yt-dlp's handling of formats, it is recommended to install FFmpeg first by using [FedericoCarboni/setup-ffmpeg](https://github.com/FedericoCarboni/setup-ffmpeg).

```yml
steps:
  - uses: actions/checkout@v2
    
  - name: Setup FFmpeg
    uses: FedericoCarboni/setup-ffmpeg@v1
    
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```