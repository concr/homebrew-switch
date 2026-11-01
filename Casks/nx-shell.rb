cask "nx-shell" do

  version "4.01"
  sha256 "5aafd64efde89c0881cdbd865a1b2b054e20329d43e0bce0e1b77378977f5878"

  url "https://github.com/joel16/NX-Shell/releases/download/#{version}/NX-Shell.nro"
  name "NX Shell"
  desc "A multi-purpose file manager for the Nintendo Switch."
  homepage "https://github.com/joel16/NX-Shell"

  livecheck do
    url :url
    strategy :github_latest
  end

  artifact "NX-Shell.nro",
    target: "#{Dir.home}/Documents/switch-sd/switch/nx-shell/nx-shell.nro"

  postflight_steps do
    write_file "#{Dir.home}/Documents/switch-sd/switch/nx-shell/nx-shell.txt", "#{version}\n"
  end

  uninstall delete: "#{Dir.home}/Documents/switch-sd/switch/nx-shell/nx-shell.txt",
            rmdir:  "#{Dir.home}/Documents/switch-sd/switch/nx-shell"

end
