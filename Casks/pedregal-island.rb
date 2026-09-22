cask "pedregal-island" do
  version "0.1.3"
  sha256 "1be6543eeeff5b31678fc67a7324837c50b6448d7b60a3ca2d464dfa6f7c1433"

  # Private release asset. One-time setup on each machine:
  #   gh auth login                    # if not already logged in
  #   mkdir -p ~/.config/pedregal
  #   gh auth token > ~/.config/pedregal/gh-token
  # The cask reads the token from that file; brew strips Authorization on
  # the cross-host redirect, but the redirect target is pre-signed (no auth).
  token = File.read(File.expand_path("~/.config/pedregal/gh-token")).strip
  asset_id = "581293605"

  url "https://api.github.com/repos/i-am-the-slime/pedregal-island-releases/releases/assets/#{asset_id}",
      header: ["Authorization: token #{token}", "Accept: application/octet-stream"]
  name "Pedregal Island"
  desc "Flashcard learning game set on Pedregal Island"
  homepage "https://github.com/i-am-the-slime/pedregal-island-releases"

  depends_on :macos

  app "Pedregal-Island-Mac/Pedregal Island.app"
end
