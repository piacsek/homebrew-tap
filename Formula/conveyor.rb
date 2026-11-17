class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.3/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "fdcebd214bf47d615152080961ffca0d99a633f0f5e208fa86fc9637a8d5b3d5"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.3/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "2aa51eeb10b5aad0ee28b5124140bd62da837a5b2a6be3b8a9b7cce3786f5711"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.3/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f7f239a8ca20701119d64467af3dbd539bb6b04b4ae61ccd008f8bcc95aed38"
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
