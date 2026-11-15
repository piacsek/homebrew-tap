class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.29.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "9496de46b022f9d1451cbb5dbdba190a7b4e860915372c30e2847d746fc038e2"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.29.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "6deae3b4192db7b105b6b5e1ce30308486c6357997f0ad2f9c03c2584603c631"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.29.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3847bf6d9622faa61569bcb9cbf0879f1c3bce14d717826fd503d317bf928a32"
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
