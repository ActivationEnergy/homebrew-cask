cask "cd2here" do
  version "0.3.1"
  sha256 "7c4673765f9252b9a6eee18ace86f9806a587dcec76987acffd948bbf6287aab"

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
