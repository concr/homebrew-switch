cask "jksv" do

  version "12.02.2025"
  sha256 "a2b7f6372a4b81f3c3194aa6f96f2824bdea853b9a8ebf8c4a008d0d865a0cbf"

  url "https://github.com/J-D-K/JKSV/releases/download/#{version.major}%2F#{version.minor}%2F#{version.patch}/JKSV.nro"
  name "JKSV"
  desc "JK's Save Manager Switch Edition."
  homepage "https://github.com/J-D-K/JKSV"

  livecheck do
    url :url
    strategy :github_latest do |json|
      month, day, year = json["tag_name"]&.split("/")
      "#{month}.#{day}.#{year}" if year
    end
  end

  artifact "JKSV.nro",
    target: "#{Dir.home}/Documents/switch/jksv/jksv.nro"

  postflight_steps do
    write_file "#{Dir.home}/Documents/switch/jksv/jksv.txt", "#{version}\n"
  end

  uninstall delete: "#{Dir.home}/Documents/switch/jksv/jksv.txt",
            rmdir:  "#{Dir.home}/Documents/switch/jksv"
  
end
