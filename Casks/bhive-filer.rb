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
  # The app has only ever been built for Apple Silicon, and Tahoe still runs on
  # the last Intel Macs — so the OS floor alone does not keep this off a machine
  # that cannot execute it.
  depends_on arch: :arm64

  # Renamed in 2.0: the bundle is "bHive.app", not "bHive Filer.app". Homebrew
  # removes the old bundle on upgrade from its own record of what it installed,
  # so the old name needs no stanza here — and must not get one, since a second
  # `app` would make brew expect both bundles inside the DMG.
  app "bHive.app"

  zap trash: [
    "~/Library/Application Support/bHive",
    "~/Library/Preferences/org.edlings.bhive.plist",
    "~/Library/Caches/org.edlings.bhive",
  ]
end
