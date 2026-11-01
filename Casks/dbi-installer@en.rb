cask "dbi-installer@en" do

  version "921,en"
  sha256 "ec6178016caf494d453701ed72397d06b039a2b5bf359a6ac28120be8494ecb5"

  lang = version.csv.second
  tag  = version.csv.first

  url "https://github.com/rashevskyv/DBIPatcher/releases/download/#{version.csv.first}/DBI.nro"
  name "DBI Installer (Localization)"
  desc "Translate DBI for other languages."
  homepage "https://github.com/rashevskyv/DBIPatcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  artifact "DBI.nro",
    target: "#{Dir.home}/Documents/switch/dbi-#{lang}/dbi-#{lang}-#{tag}.nro"

  postflight_steps do
    run "/usr/bin/curl",
      args: [ "-fsSL", "-o", "translation.bin", "#{homepage}/releases/download/#{tag}/translation_#{lang}.bin" ],
      chdir: "#{Dir.home}/Documents/switch/dbi-#{lang}",
      network_access: true
    
    # curl -sL https://github.com/rashevskyv/DBIPatcher/releases/download/921/translation_en.bin | sha256sum
    write "translation.sha256", "5c8052362b5dd9b0a9255dfa740a1bee0151f2f22d57dabaf0b19722e118ed13  translation.bin\n"
    
    run "/sbin/sha256sum",
      args: [ "-c", "translation.sha256" ],
      chdir: "#{Dir.home}/Documents/switch/dbi-#{lang}"
  end

end
