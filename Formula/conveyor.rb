class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.30.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "055f8550ac79067180b5387b1e64d1fdd73c1e74f0f86108136541b45245ac04"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.30.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "4376cd2c445dff0f7044942fcf0caae7039796b6ce7a4bc8138eb47809f0907f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.30.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "beead9bb2aa0a061cfaab73ff53623e05d94a1b191fdd64cd1cd7f28ad64fd17"
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
