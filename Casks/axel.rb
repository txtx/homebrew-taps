cask "axel" do
  version "0.2.0"
  sha256 "b8b327e37a1ff4fb16b0ab27657ff623dd531a09f3e378fe092f715236bf06a1"

  url "https://txtx-public.s3.amazonaws.com/releases/axel/Axel-#{version}-macos.dmg"
  name "Axel"
  desc "AI-powered terminal workspace manager"
  homepage "https://github.com/txtx/axel"

  livecheck do
    url "https://txtx-public.s3.amazonaws.com/releases/axel/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "Axel.app"

  zap trash: [
    "~/Library/Application Support/Axel",
    "~/Library/Caches/Axel",
    "~/Library/Preferences/com.txtx.Axel.plist",
  ]
end
