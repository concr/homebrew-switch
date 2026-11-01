cask "aio-switch-updater" do

  version "2.23.3"
  sha256 "d7261127b75434cc5087e1e796a62d54089ea104aff4973d5708e7db06f326b2"

  url "https://github.com/HamletDuFromage/aio-switch-updater/releases/download/#{version}/aio-switch-updater.zip"
  name "aio-switch-updater"
  desc "Update your CFW, cheat codes, firmwares and more directly from your Nintendo Switch!"
  homepage "https://github.com/HamletDuFromage/aio-switch-updater"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "aio-switch-updater.zip",
    target: "#{ENV.fetch("HOME")}/Documents/switch-apps/aio-switch-updater-#{version}.nro"

end
