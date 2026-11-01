cask "switch-90dns-tester" do

  version "1.1.0"
  sha256 "0ce5c67e93983f14161148b8796726ebf6b4f86ffb77b49b842fe017c7e5fd14"

  url "https://github.com/meganukebmp/Switch_90DNS_tester/releases/download/v#{version}/Switch_90DNS_tester.nro"
  name "switch-90dns-tester"
  desc "A simple homebrew application to test 90DNS or Atmosphere DNS MITM on the switch."
  homepage "https://github.com/meganukebmp/Switch_90DNS_tester"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Switch_90DNS_tester.nro",
    target: "#{ENV.fetch("HOME")}/Documents/switch/switch-90dns-tester/switch-90dns-tester-#{version}.nro"

end
