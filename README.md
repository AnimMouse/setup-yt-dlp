# Setup yt-dlp for GitHub Actions
Setup [yt-dlp](https://github.com/yt-dlp/yt-dlp) (a [youtube-dl](https://github.com/ytdl-org/youtube-dl) fork) on GitHub Actions to use `yt-dlp`.

This action installs [yt-dlp](https://github.com/yt-dlp/yt-dlp) for use in actions by installing it on tool cache using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).

This action is implemented as a [composite](https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-composite-action) action.

## Usage
To use `yt-dlp`, run this action before `yt-dlp`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

## FFmpeg
To improve yt-dlp's handling of formats, like [merging `bestvideo+bestaudio` instead of just using `best`](https://github.com/yt-dlp/yt-dlp/#strongly-recommended), it is recommended to install [FFmpeg](https://ffmpeg.org).\
By default, this action will install FFmpeg automatically.

For Linux & Windows, this action will install [yt-dlp/FFmpeg-Builds](https://github.com/yt-dlp/FFmpeg-Builds) with some patches necessary for smooth integration with yt-dlp using `AnimMouse/setup-yt-dlp/ffmpeg@v3`.\
For macOS, you need to run [AnimMouse/setup-ffmpeg](https://github.com/AnimMouse/setup-ffmpeg) first as yt-dlp/FFmpeg-Builds currently does not have macOS builds.

### Disable
If you don't want to install FFmpeg automatically, set `ffmpeg` to `false`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    with:
      ffmpeg: false
```

## aria2
It is recommended to use [aria2](https://aria2.github.io) as the downloader for yt-dlp, this will improve the downloading process and [aria2 is already preinstalled](https://github.com/actions/runner-images/issues/970) in GitHub Actions.\
By default, this action will write to yt-dlp config to use aria2 automatically.

### Disable
If you don't want to use aria2, set `aria2` to `false`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    with:
      aria2: false
```

## YouTube cookies
Currently, YouTube requires data center IP addresses to be signed in.\
The error `Sign in to confirm you’re not a bot. This helps protect our community. Learn more` appears.

To bypass this, use the `AnimMouse/setup-yt-dlp/cookies@v3` action to sign in and pass cookies.\
Follow the instructions at [yt-dlp wiki](https://github.com/yt-dlp/yt-dlp/wiki/Extractors#exporting-youtube-cookies) to get the cookies.txt file.

Encode the cookies.txt file in Base64 using this command `base64 -w 0 cookies.txt` and paste it to the `YOUTUBE_COOKIES` secret.

> [!CAUTION]
> Do not use your personal account for cookies. Use a dummy account, and create a brand account inside of it, and use that to sign in. This passing the cookies method may result in your account being [blocked](https://github.com/yt-dlp/yt-dlp/issues/10085).

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    
  - name: Setup yt-dlp YouTube cookies
    uses: AnimMouse/setup-yt-dlp/oauth@v3
    with:
      cookies: ${{ secrets.YOUTUBE_COOKIES }}
      
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
```

By default, this action will write to yt-dlp config to pass cookies automatically

### Disable
If you don't want to pass cookies automatically, set `enable` to `false`.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    
  - name: Setup yt-dlp YouTube cookies
    uses: AnimMouse/setup-yt-dlp/oauth@v3
    with:
      cookies: ${{ secrets.YOUTUBE_COOKIES }}
      enable: false
      
  - run: yt-dlp --cookies ~/.cache/yt-dlp/youtube/cookies.txt https://www.youtube.com/watch?v=BaW_jenozKc
```

### Update cookies
Cookies have expiration, which means it has to be refreshed, or else it will expire and it will not work anymore. To prevent expiration, yt-dlp automatically refreshes the cookies as needed.\
To update those cookies in GitHub secrets, use the `AnimMouse/setup-yt-dlp/cookies/update@v3` action to update those cookies.

This requires a fine-grained personal access token that has read and write access to the secrets scope in the current repository to update the secret as the default `GITHUB_TOKEN` does not have access to the secrets scope.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    
  - name: Setup yt-dlp YouTube cookies
    uses: AnimMouse/setup-yt-dlp/cookies@v3
    with:
      cookies: ${{ secrets.YOUTUBE_COOKIES }}
      
  - run: yt-dlp https://www.youtube.com/watch?v=BaW_jenozKc
    
  - name: Update yt-dlp YouTube cookies
    uses: AnimMouse/setup-yt-dlp/cookies/update@v3
    with:
      cookies_secret_name: YOUTUBE_COOKIES
      token: ${{ secrets.GH_PAT }}
```

### Specific version
You can specify the version you want. By default, this action downloads the latest version if the version is not specified.

#### Specific stable
```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    with:
      version: 2022.02.04
```

#### Latest nightly
```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    with:
      nightly: true
```

#### Specific nightly
```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    with:
      version: 2024.02.04.232659
      nightly: true
```

### GitHub token
This action automatically uses a GitHub token in order to authenticate with the GitHub API and avoid rate limiting. You can also specify your own read-only fine-grained personal access token.

```yaml
steps:
  - name: Setup yt-dlp
    uses: AnimMouse/setup-yt-dlp@v3
    with:
      token: ${{ secrets.GH_PAT }}
```