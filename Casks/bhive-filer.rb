cask "bhive-filer" do
  version :latest
  sha256 :no_check

  # Routed through the site's counted redirect (?src=brew), so Homebrew
  # installs show up in the download stats as their own channel and still
  # land on the same notarized DMG on S3 that the website serves.
  url "https://bhive.software/download.php?src=brew"
  name "bHive Filer"
  desc "Private, offline semantic file search"
  homepage "https://bhive.software/"

  # The app updates itself via Sparkle after install.
  auto_updates true
  depends_on macos: :sequoia

  app "bHive Filer.app"

  zap trash: [
    "~/Library/Application Support/bHive",
    "~/Library/Preferences/org.edlings.bhive.plist",
    "~/Library/Caches/org.edlings.bhive",
  ]
end
