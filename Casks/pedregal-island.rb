cask "pedregal-island" do
  version "0.1.3"
  sha256 "4d53b85f2b120f6db3fa3c7087355c6c2bff82fc845137e3f0e29a9bad3ffbe9"

  # Private release asset. One-time setup on each machine:
  #   gh auth login                    # if not already logged in
  #   mkdir -p ~/.config/pedregal
  #   gh auth token > ~/.config/pedregal/gh-token
  # The cask reads the token from that file; brew strips Authorization on
  # the cross-host redirect, but the redirect target is pre-signed (no auth).
  token = File.read(File.expand_path("~/.config/pedregal/gh-token")).strip
  asset_id = "581298874"

  url "https://api.github.com/repos/i-am-the-slime/pedregal-island-releases/releases/assets/#{asset_id}",
      header: ["Authorization: token #{token}", "Accept: application/octet-stream"]
  name "Pedregal Island"
  desc "Flashcard learning game set on Pedregal Island"
  homepage "https://github.com/i-am-the-slime/pedregal-island-releases"

  depends_on :macos

  app "Pedregal-Island-Mac/Pedregal Island.app"

  # The app is ad-hoc signed (no Developer ID), so Gatekeeper warns on first
  # launch unless the quarantine flag is stripped after install/upgrade.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine",
      "/Applications/Pedregal Island.app"]
  end
end
