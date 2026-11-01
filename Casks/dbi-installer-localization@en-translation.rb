cask "dbi-installer-localization@en-translation" do

  version "921"
  sha256 "5c8052362b5dd9b0a9255dfa740a1bee0151f2f22d57dabaf0b19722e118ed13"

  url "https://github.com/rashevskyv/DBIPatcher/releases/download/#{version}/translation_en.bin"
  name "DBI Installer (Localization) English Translation"
  desc "Ultimate solution to install NSP, NSZ, XCI and XCZ files along with many advanced features."
  homepage "https://github.com/rashevskyv/DBIPatcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on cask: "dbi-installer-localization@en-base"
  conflicts_with cask: "dbi-installer-localization@de-translation"

  artifact "translation_en.bin",
    target: "#{Dir.home}/Documents/switch/dbi-#{lang}/translation.bin"

  postflight_steps do
    write_file "#{Dir.home}/Documents/switch/dbi-#{lang}/dbi-#{lang}.txt", "#{version}en\n"
  end

end
