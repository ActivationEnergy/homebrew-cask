cask "cd2here" do
  version "0.3.3"
  sha256 "704852a0f15745c9c3261ecd1c3d77e9a270aca611ac86a2f5f31d7c5700d3ac"

  url "https://github.com/ActivationEnergy/cd2here/releases/download/v#{version}/cd2here-v#{version}-darwin-universal.zip"
  name "cd2here"
  desc "Open the Finder-selected directory in your terminal with one toolbar click"
  homepage "https://github.com/ActivationEnergy/cd2here"

  livecheck do
    url :url
    strategy :github_latest_release
  end

  depends_on macos: :ventura

  app "cd2hereWindow.app"
  app "cd2hereTab.app"

  zap trash: [
    "~/Library/Preferences/io.github.activationenergy.cd2here.plist",
    # Legacy suite from the previous owner; cd2here migrates the value on
    # first launch but does not delete the old plist.
    "~/Library/Preferences/io.github.xiaojf.cd2here.plist",
  ]
end
