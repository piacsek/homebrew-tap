class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.36.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "5f5f509d92d922367b6b6925aef768645db04acbfb9ea08938c1fa408e8cc7b1"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.36.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "cc1c5cc371450c48de8633c35b7fb46ebc67ee97203ffb6cb767d89899c2afef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.36.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aec479426bc09fb4edfc9592675538c2895c0efbc140217b0416ddad890982f0"
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
