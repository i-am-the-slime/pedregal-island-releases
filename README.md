# Pedregal Island — Mac releases (private)

Install / upgrade (after one-time setup below):

```sh
brew tap i-am-the-slime/pedregal-island-releases https://github.com/i-am-the-slime/pedregal-island-releases.git
brew install --cask i-am-the-slime/pedregal-island-releases/pedregal-island
```

## One-time setup per machine

1. Install Homebrew, then:
   ```sh
   brew install gh && gh auth login
   ```
2. Give brew access to the private release asset:
   ```sh
   mkdir -p ~/.config/pedregal
   gh auth token > ~/.config/pedregal/gh-token
   chmod 600 ~/.config/pedregal/gh-token
   ```
3. `brew tap` + `brew install` as above. You'll be asked to
   `brew trust --command` once if this repo also ships commands.

## Releasing

1. Build the Mac zip per `docs/mac-packaging.md`.
2. Upload as a release asset (`Pedregal-Island-Mac-<v>-arm64.zip`) with tag `v<v>`.
3. Update `version`, `sha256`, and the asset id in `Casks/pedregal-island.rb`.
