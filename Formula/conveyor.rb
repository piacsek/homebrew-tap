class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.5/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "c77af82e0d966c8f47e4f15df7ad4eafa8173a6385a4ce3eb39074310ce873cb"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.5/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "fbf3b705cd0b4ee9102cb5d8dce1b808e4e370942974293a1b8c84b3eea5644c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.5/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb14fcc20fce4b120b3df1430b9cb2c72383b84289b28ff60fa1d0388f54e1ce"
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
