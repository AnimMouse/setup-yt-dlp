# Setup yt-dlp for GitHub Actions
Setup [yt-dlp](https://github.com/yt-dlp/yt-dlp) (a [youtube-dl](https://github.com/ytdl-org/youtube-dl) fork) on GitHub Actions to use `yt-dlp`.

This action installs [yt-dlp](https://github.com/yt-dlp/yt-dlp) for use in actions by installing it using `pipx`.

## Usage
To use `yt-dlp`, run this action before `yt-dlp`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

## FFmpeg
To improve yt-dlp's handling of formats, like merging `bestvideo+bestaudio` instead of just using `best`, it is recommended to install [FFmpeg](https://ffmpeg.org) by setting `with-ffmpeg` to `true`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    with:
      with-ffmpeg: true
      
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

For Linux & Windows, this will install [yt-dlp/FFmpeg-Builds](https://github.com/yt-dlp/FFmpeg-Builds) with some patches necessary for smooth integration with yt-dlp using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).\
For macOS, you need to run [FedericoCarboni/setup-ffmpeg](https://github.com/FedericoCarboni/setup-ffmpeg) as the built-in FFmpeg installer for macOS has been removed.

If you already installed FFmpeg in GitHub Runners, no need to set `with-ffmpeg` to `true`.

## aria2
It is recommended to use [aria2](https://aria2.github.io) as the downloader for yt-dlp, this will improve the downloading process and [aria2 is already preinstalled](https://github.com/actions/virtual-environments/issues/970) in GitHub actions.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    with:
      with-ffmpeg: true
      
  - run: yt-dlp --downloader aria2c https://www.youtube.com/watch?v=BaW_jenozKc
```