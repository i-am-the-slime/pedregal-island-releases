cask "pedregal-island" do
  version "0.1.1"
  sha256 "6d9c12dc5322fe7938e4ecaa235b3fdc6dc9cdbaca672683e0b0a831536e45f0"

  # Private release asset. One-time setup on each machine:
  #   gh auth login                    # if not already logged in
  #   mkdir -p ~/.config/pedregal
  #   gh auth token > ~/.config/pedregal/gh-token
  # The cask reads the token from that file; brew strips Authorization on
  # the cross-host redirect, but the redirect target is pre-signed (no auth).
  token = File.read(File.expand_path("~/.config/pedregal/gh-token")).strip
  asset_id = "578666683"

  url "https://api.github.com/repos/i-am-the-slime/pedregal-island-releases/releases/assets/#{asset_id}",
      header: ["Authorization: token #{token}", "Accept: application/octet-stream"]
  name "Pedregal Island"
  desc "Flashcard learning game set on Pedregal Island"
  homepage "https://github.com/i-am-the-slime/pedregal-island-releases"

  depends_on :macos

  app "Pedregal-Island-Mac/Pedregal Island.app"
end
