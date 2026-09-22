cask "pedregal-island" do
  version "0.1.3"
  sha256 "4d53b85f2b120f6db3fa3c7087355c6c2bff82fc845137e3f0e29a9bad3ffbe9"

  url "https://github.com/i-am-the-slime/pedregal-island-releases/releases/download/v#{version}/Pedregal-Island-Mac-#{version}-arm64.zip"
  name "Pedregal Island"
  desc "Flashcard learning game set on Pedregal Island"
  homepage "https://github.com/i-am-the-slime/pedregal-island-releases"

  depends_on :macos

  app "Pedregal-Island-Mac/Pedregal Island.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine",
      "/Applications/Pedregal Island.app"]
  end
end
