class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.21.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "b512128e7e8ecb702573d7a21fbf67dc410223d2f5baaf262fbe70fb93b2ce74"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.21.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "aab3454214fbeba9d487873c4c18f9213099e636863c37e8b9da62a27ab3bf4b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.21.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d083adaa41709430fd5b216e9cfb4237afe2bbf62761ce159bda0f3f67e12f1"
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
