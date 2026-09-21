cask "pedregal-island" do
  version "0.1.2"
  sha256 "a361240eef6af9948a13722a5b8e7fd2733b94e5a0f3ad59afb413ab1b70c03e"

  # Private release asset. One-time setup on each machine:
  #   gh auth login                    # if not already logged in
  #   mkdir -p ~/.config/pedregal
  #   gh auth token > ~/.config/pedregal/gh-token
  # The cask reads the token from that file; brew strips Authorization on
  # the cross-host redirect, but the redirect target is pre-signed (no auth).
  token = File.read(File.expand_path("~/.config/pedregal/gh-token")).strip
  asset_id = "578698431"

  url "https://api.github.com/repos/i-am-the-slime/pedregal-island-releases/releases/assets/#{asset_id}",
      header: ["Authorization: token #{token}", "Accept: application/octet-stream"]
  name "Pedregal Island"
  desc "Flashcard learning game set on Pedregal Island"
  homepage "https://github.com/i-am-the-slime/pedregal-island-releases"

  depends_on :macos

  app "Pedregal-Island-Mac/Pedregal Island.app"
end
