cask "dbi-installer" do

  version "912,ru"
  sha256 "e77da77f95a24f94fb39df23513961846a75d07aa2f970f39846ed7bbbd22bd2"

  tag = version.csv.first
  lang = version.csv.second

  url "https://github.com/rashevskyv/dbi/releases/download/#{tag}#{lang}/DBI.nro"
  name "DBI Installer (Russian Version)"
  desc "Ultimate solution to install NSP, NSZ, XCI and XCZ files along with many advanced features."
  homepage "https://github.com/rashevskyv/DBIPatcher"

  livecheck do
    url :url
    regex(/^(\d+)(#{lang})$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"] || release["prerelease"]

        match = release["tag_name"]&.match(regex)
        "#{match[1]},#{match[2]}" if match
      end
    end
  end

  conflicts_with cask: "dbi-installer@de"
  conflicts_with cask: "dbi-installer@de-base"
  conflicts_with cask: "dbi-installer@en"
  conflicts_with cask: "dbi-installer@en-base"

  artifact "DBI.nro",
    target: "#{Dir.home}/Documents/switch-sd/switch/dbi/dbi.nro"

  postflight_steps do
    write_file "#{Dir.home}/Documents/switch-sd/switch/dbi/dbi.txt", "#{tag},#{lang}\n"
  end

  uninstall delete: "#{Dir.home}/Documents/switch-sd/switch/dbi/dbi.txt",
            rmdir:  "#{Dir.home}/Documents/switch-sd/switch/dbi"

end
