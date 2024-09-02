# Setup yt-dlp for GitHub Actions
Setup [yt-dlp](https://github.com/yt-dlp/yt-dlp) (a [youtube-dl](https://github.com/ytdl-org/youtube-dl) fork) on GitHub Actions to use `yt-dlp`.

This action installs [yt-dlp](https://github.com/yt-dlp/yt-dlp) for use in actions by installing it on tool cache using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).

This action is implemented as a [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action) action.

## Usage
To use `yt-dlp`, run this action before `yt-dlp`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

## FFmpeg
To improve yt-dlp's handling of formats, like [merging `bestvideo+bestaudio` instead of just using `best`](https://github.com/yt-dlp/yt-dlp/#strongly-recommended), it is recommended to install [FFmpeg](https://ffmpeg.org) by setting `with-ffmpeg` to `true`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    with:
      with-ffmpeg: true
      
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

For Linux & Windows, this will install [yt-dlp/FFmpeg-Builds](https://github.com/yt-dlp/FFmpeg-Builds) with some patches necessary for smooth integration with yt-dlp using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).\
For macOS, you need to run [AnimMouse/setup-ffmpeg](https://github.com/AnimMouse/setup-ffmpeg) first as yt-dlp/FFmpeg-Builds currently does not have macOS builds.

If you already installed FFmpeg in GitHub runners, no need to set `with-ffmpeg` to `true`.

## aria2
It is recommended to use [aria2](https://aria2.github.io) as the downloader for yt-dlp, this will improve the downloading process and [aria2 is already preinstalled](https://github.com/actions/runner-images/issues/970) in GitHub Actions.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    with:
      with-ffmpeg: true
      
  - run: yt-dlp --downloader aria2c https://www.youtube.com/watch?v=BaW_jenozKc
```

## YouTube OAuth2
Currently, YouTube requires data center IP addresses to be signed in. The error `Sign in to confirm you’re not a bot. This helps protect our community. Learn more` appears.

To bypass this, use the `AnimMouse/setup-yt-dlp/oauth2@v1` action to sign in and pass the OAuth credentials via the [coletdjnz/yt-dlp-youtube-oauth2](https://github.com/coletdjnz/yt-dlp-youtube-oauth2) plugin.\
Follow the instructions at [coletdjnz/yt-dlp-youtube-oauth2](https://github.com/coletdjnz/yt-dlp-youtube-oauth2#logging-in) to get the token_data.json file.

Encode the token_data.json file in Base64 using this command `base64 -w 0 token_data.json` and paste it to the `YOUTUBE_OAUTH2_TOKEN_DATA` secret. And add `--username oauth2 --password ''` to the command-line options.

> [!CAUTION]
> Do not use your personal account for OAuth credentials. Use a dummy account, and create a brand account inside of it, and use that to sign in. This OAuth method may result in your account being [blocked](https://github.com/yt-dlp/yt-dlp/issues/10085).

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    with:
      with-ffmpeg: true
      nightly: true
      
  - name: Setup yt-dlp-youtube-oauth2 plugin
    uses: AnimMouse/setup-yt-dlp/oauth2@v1
    with:
      token_data: ${{ secrets.YOUTUBE_OAUTH2_TOKEN_DATA }}
      
  - run: yt-dlp --downloader aria2c --username oauth2 --password '' https://www.youtube.com/watch?v=BaW_jenozKc
```

### Specific version
You can specify the version you want. By default, this action downloads the latest version if version is not specified.

#### Specific stable
```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    with:
      version: 2022.02.04
```

#### Latest nightly
```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    with:
      nightly: true
```

#### Specific nightly
```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    with:
      version: 2024.02.04.232659
      nightly: true
```

### GitHub token
This action automatically uses a GitHub token in order to authenticate with GitHub API and avoid rate limiting. You can also specify your own read-only fine-grained personal access token.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v1
    with:
      token: ${{ secrets.GH_PAT }}
```