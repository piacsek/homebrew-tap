class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.4/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "87ef61c0a29f8e01124dc85e795ffa74d94070603b9401ded1726c3bbed106c2"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.4/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "41c534e231af6ce4f90cc849b9b984db6aed1673f6cc7849811539e329b90395"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.4/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9cbfa3f8266bc005b87433c7058b92b2acf3c7e23a33e25aa1bfd057e7192f40"
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
