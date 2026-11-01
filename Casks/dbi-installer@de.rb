cask "dbi-installer@de" do

  version "921,de"
  sha256 "fe0ca0c0894c6f4a7ebaf93642e56138ec92b1af95c2e122d79d2dc25f7d255f"

  tag = version.csv.first
  lang = version.csv.second

  url "https://github.com/rashevskyv/DBIPatcher/releases/download/#{tag}/translation_#{lang}.bin"
  name "DBI Installer (Localization) English Translation"
  desc "Ultimate solution to install NSP, NSZ, XCI and XCZ files along with many advanced features."
  homepage "https://github.com/rashevskyv/DBIPatcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on cask: "dbi-installer-localization@#{lang}-base"

  artifact "translation_#{lang}.bin",
    target: "#{Dir.home}/Documents/switch/dbi-#{lang}/translation.bin"

  postflight_steps do
    write_file "#{Dir.home}/Documents/switch/dbi-#{lang}/translation.txt", "#{tag},#{lang}\n"
  end

  uninstall delete: [
    "#{Dir.home}/Documents/switch/dbi-#{lang}/translation.txt",
  ]

  uninstall rmdir: [
    "#{Dir.home}/Documents/switch/dbi-#{lang}",
  ]

end
