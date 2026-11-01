cask "dbi-installer@en" do

  version "921,en"
  sha256 "5c8052362b5dd9b0a9255dfa740a1bee0151f2f22d57dabaf0b19722e118ed13"

  tag = version.csv.first
  lang = version.csv.second

  url "https://github.com/rashevskyv/DBIPatcher/releases/download/#{tag}/translation_#{lang}.bin"
  name "DBI Installer (Localization) English Translation"
  desc "Ultimate solution to install NSP, NSZ, XCI and XCZ files along with many advanced features."
  homepage "https://github.com/rashevskyv/DBIPatcher"

  livecheck do
    url :url
    strategy :github_latest do |json|
      "#{json["tag_name"]},#{lang}" if json["tag_name"]&.match?(/^\d+$/)
    end
  end

  depends_on cask: "dbi-installer@#{lang}-base"

  artifact "translation_#{lang}.bin",
    target: "#{Dir.home}/Documents/switch/dbi-#{lang}/translation.bin"

  postflight_steps do
    write_file "#{Dir.home}/Documents/switch/dbi-#{lang}/translation.txt", "#{tag},#{lang}\n"
  end

  uninstall delete: "#{Dir.home}/Documents/switch/dbi-#{lang}/translation.txt",
            rmdir:  "#{Dir.home}/Documents/switch/dbi-#{lang}"

end
