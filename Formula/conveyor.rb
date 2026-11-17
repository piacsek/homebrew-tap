class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "4a7e3470e1b70e1a94839a3277a929a36886c4671c0c1f8b02ee35cb557cfc7a"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "abd650ae156ac3c96e68b561ed244b1f0cbb63e3039d72aee2510025128161e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "952fbec1ec51ab663c43902e93e3f8acfaf3a16fd7e7694cf4fe2a88433d15a6"
    end
  end

  def install
    bin.install "conveyor"
  end

  test do
    assert_match "usage", shell_output("#{bin}/conveyor bogus 2>&1", 1)
    assert_match "[prs]", shell_output("#{bin}/conveyor config")
  end
end
