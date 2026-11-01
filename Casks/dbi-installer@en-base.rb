cask "dbi-installer@en-base" do

  version "921,en"
  sha256 "ec6178016caf494d453701ed72397d06b039a2b5bf359a6ac28120be8494ecb5"

  tag = version.csv.first
  lang = version.csv.second

  url "https://github.com/rashevskyv/DBIPatcher/releases/download/#{tag}/DBI.nro"
  name "DBI Installer (Localization) Base"
  desc "Ultimate solution to install NSP, NSZ, XCI and XCZ files along with many advanced features."
  homepage "https://github.com/rashevskyv/DBIPatcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  # depends_on cask: "dbi-installer-localization@#{lang}-translation"

  artifact "DBI.nro",
    target: "#{Dir.home}/Documents/switch/dbi-#{lang}/dbi.nro"

  postflight_steps do
    write_file "#{Dir.home}/Documents/switch/dbi-#{lang}/dbi.txt", "#{tag},#{lang}\n"
  end

  zap trash: [
    "#{Dir.home}/Documents/switch/dbi-#{lang}/dbi.txt",
    "#{Dir.home}/Documents/switch/dbi-#{lang}",
  ]

end
