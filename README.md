# Setup yt-dlp for GitHub Actions
Setup [yt-dlp](https://github.com/yt-dlp/yt-dlp) (a [youtube-dl](https://github.com/ytdl-org/youtube-dl) fork) on GitHub Actions to use `yt-dlp`.

This action installs [yt-dlp](https://github.com/yt-dlp/yt-dlp) for use in actions by installing it on tool cache using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).

This action is implemented as a [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action) action.

## Usage
To use `yt-dlp`, run this action before `yt-dlp`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v2
    
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

## FFmpeg
To improve yt-dlp's handling of formats, like [merging `bestvideo+bestaudio` instead of just using `best`](https://github.com/yt-dlp/yt-dlp/#strongly-recommended), it is recommended to install [FFmpeg](https://ffmpeg.org) by setting `with-ffmpeg` to `true`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v2
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
    uses: AnimMouse/setup-yt-dlp@v2
    with:
      with-ffmpeg: true
      
  - run: yt-dlp --downloader aria2c https://www.youtube.com/watch?v=BaW_jenozKc
```

## YouTube OAuth
Currently, YouTube requires data center IP addresses to be signed in. The error `Sign in to confirm you’re not a bot. This helps protect our community. Learn more` appears.

To bypass this, use the `AnimMouse/setup-yt-dlp/oauth@v2` action to sign in and pass the OAuth credentials.
Follow the instructions at [yt-dlp wiki](https://github.com/yt-dlp/yt-dlp/wiki/Extractors#logging-in-with-oauth) to get the oauth_refresh_token_default.json file.

Encode the oauth_refresh_token_default.json file in Base64 using this command `base64 -w 0 oauth_refresh_token_default.json` and paste it to the `YOUTUBE_OAUTH_REFRESH_TOKEN` secret. And add `--username oauth --password ''` to the command-line options.

> [!CAUTION]
> Do not use your personal account for OAuth credentials. Use a dummy account, and create a brand account inside of it, and use that to sign in. This OAuth method may result in your account being [blocked](https://github.com/yt-dlp/yt-dlp/issues/10085).

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v2
    with:
      with-ffmpeg: true
      
  - name: Setup yt-dlp YouTube OAuth
    uses: AnimMouse/setup-yt-dlp/oauth@v2
    with:
      refresh-token: ${{ secrets.YOUTUBE_OAUTH_REFRESH_TOKEN }}
      
  - run: yt-dlp --downloader aria2c --username oauth --password '' https://www.youtube.com/watch?v=BaW_jenozKc
```

### Specific version
You can specify the version you want. By default, this action downloads the latest version if the version is not specified.

#### Specific stable
```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v2
    with:
      version: 2022.02.04
```

#### Latest nightly
```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v2
    with:
      nightly: true
```

#### Specific nightly
```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v2
    with:
      version: 2024.02.04.232659
      nightly: true
```

### GitHub token
This action automatically uses a GitHub token in order to authenticate with the GitHub API and avoid rate limiting. You can also specify your own read-only fine-grained personal access token.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v2
    with:
      token: ${{ secrets.GH_PAT }}
```