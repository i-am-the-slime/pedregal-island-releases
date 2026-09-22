cask "pedregal-island" do
  version "0.1.3"
  sha256 "14fb3c5137d33b9da6f10cdc34f53051bb21e5978d170418d10150ff93636410"

  # Private release asset. One-time setup on each machine:
  #   gh auth login                    # if not already logged in
  #   mkdir -p ~/.config/pedregal
  #   gh auth token > ~/.config/pedregal/gh-token
  # The cask reads the token from that file; brew strips Authorization on
  # the cross-host redirect, but the redirect target is pre-signed (no auth).
  token = File.read(File.expand_path("~/.config/pedregal/gh-token")).strip
  asset_id = "581295760"

  url "https://api.github.com/repos/i-am-the-slime/pedregal-island-releases/releases/assets/#{asset_id}",
      header: ["Authorization: token #{token}", "Accept: application/octet-stream"]
  name "Pedregal Island"
  desc "Flashcard learning game set on Pedregal Island"
  homepage "https://github.com/i-am-the-slime/pedregal-island-releases"

  depends_on :macos

  app "Pedregal-Island-Mac/Pedregal Island.app"
end
