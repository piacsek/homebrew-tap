class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.23.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "89497f84227b1f3a58d3de2f2b0d88f36a9437c0a65227502aed5d1aa5e4fd6e"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.23.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "42223ef8e311494585560da6b56bbb77351c79677861a6f6e8c51af86159ae6e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.23.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "215b99d645ee41c26bfb67323b5c3065e4f6c059aa037f7334aaecf4b31634df"
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
