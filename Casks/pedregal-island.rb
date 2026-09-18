cask "pedregal-island" do
  version "0.1.0"
  sha256 "53dcd1501ff7932560e83c7d14d93035f120b17712c376d8d5fb23b8d30692ae"

  url "https://github.com/i-am-the-slime/pedregal-island-releases/releases/download/v#{version}/Pedregal-Island-Mac-#{version}-arm64.zip"
  name "Pedregal Island"
  desc "Flashcard learning game set on Pedregal Island"
  homepage "https://github.com/i-am-the-slime/pedregal-island-releases"

  app "Pedregal Island.app"
end
