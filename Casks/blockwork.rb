cask "blockwork" do
  version "0.6.4"
  sha256 "2c31bbb699ad9f3e6a967f4064e16841958c358e82f6b3061f23f655c0269745"

  url "https://github.com/Blockworked/Blockwork/releases/download/0.6.4/blockwork-macos-arm64.app.zip"
  name "Blockwork"
  desc "Visually build and run keyboard and mouse macros"
  homepage "https://github.com/Blockworked/Blockwork"

  depends_on arch: :arm64

  app "Blockwork.app"

  # The app is only ad-hoc signed (no Developer ID), so drop the quarantine flag
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Blockwork.app"]
  end

  zap trash: [
    "~/Library/Application Support/Blockwork",
    "~/Library/Caches/blockwork",
  ]

  caveats <<~EOS
    Blockwork is not notarized by Apple. This cask removes the quarantine
    attribute after install so it can launch. It also needs Accessibility and
    Input Monitoring permissions in System Settings > Privacy & Security.
  EOS
end
