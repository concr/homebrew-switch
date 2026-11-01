cask "dbi-installer@en" do

  version "921,en"
  sha256 "ec6178016caf494d453701ed72397d06b039a2b5bf359a6ac28120be8494ecb5"

  url "https://github.com/rashevskyv/DBIPatcher/releases/download/#{version.csv.first}/DBI.nro"
  name "DBI Installer (Localization)"
  desc "Translate DBI for other languages."
  homepage "https://github.com/rashevskyv/DBIPatcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  artifact "DBI.nro",
    target: "#{Dir.home}/Documents/switch/dbi-#{version.csv.second}/dbi-#{version.csv.second}-#{version.csv.first}.nro"

  artifact "translation_#{version.csv.second}.bin",
    target: "#{Dir.home}/Documents/switch/dbi-#{version.csv.second}/translation.bin"


end
