cask "dbi-installer-localization@en-base" do

  version "921"
  sha256 "ec6178016caf494d453701ed72397d06b039a2b5bf359a6ac28120be8494ecb5"

  url "https://github.com/rashevskyv/DBIPatcher/releases/download/#{version}/DBI.nro"
  name "DBI Installer (Localization) Base"
  desc "Ultimate solution to install NSP, NSZ, XCI and XCZ files along with many advanced features."
  homepage "https://github.com/rashevskyv/DBIPatcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on "dbi-installer-localization@en-base"
  
  conflicts_with cask: "dbi-installer-localization@de-base"

  artifact "DBI.nro",
    target: "#{Dir.home}/Documents/switch/dbi-#{lang}/dbi-#{lang}.nro"

  postflight_steps do
    write_file "#{Dir.home}/Documents/switch/dbi-#{lang}/dbi-#{lang}.txt", "#{version}\n"
  end

end
