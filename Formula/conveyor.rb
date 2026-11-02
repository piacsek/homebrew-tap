class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.20.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "ae9eceb257404f1e16633e22e3708d2b95eeb275aafc7eeb89aa06ed6a8bec95"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.20.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "d945f25e27aed96593c0a16c7817290014504efc981c4e22e530ed53b5a44b0e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.20.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b88704f3c8c6d5cdf2cf7452920ae12eed01ab611da701c8b1d9ff7b3edc6c9"
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
