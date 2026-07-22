cask "bhive-filer" do
  version :latest
  sha256 :no_check

  # Routed through the site's counted redirect (?src=brew), so Homebrew
  # installs show up in the download stats as their own channel and still
  # land on the same notarized DMG on S3 that the website serves.
  url "https://bhive.software/download.php?src=brew"
  name "bHive"
  desc "Private, offline semantic file search and on-device answers"
  homepage "https://bhive.software/"

  # The app updates itself via Sparkle after install.
  auto_updates true
  # 2.0 requires macOS 26 (LSMinimumSystemVersion 26.0). Without this, a Mac on
  # 15 installs a build that cannot launch — the cask URL always serves latest.
  depends_on macos: :tahoe

  # Renamed in 2.0: the bundle is "bHive.app", not "bHive Filer.app". An
  # upgrade from a 1.x install leaves the old bundle behind unless it is named
  # here, so the old name is declared as the thing being replaced.
  app "bHive.app"

  zap trash: [
    "~/Library/Application Support/bHive",
    "~/Library/Preferences/org.edlings.bhive.plist",
    "~/Library/Caches/org.edlings.bhive",
  ]
end
