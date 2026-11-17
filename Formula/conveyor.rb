class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.2/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "5ebe21ccc91b956dc2a418fac44daa7b067f8d9d501caac5b3fe5aa42cd69137"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.2/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "54f481c23f2e2f0dcd0503ea6a2bd2e7b7427bd497607b676fac2d69fd333373"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.2/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a763ab789cefd47656837d8310858cbe122751a882ba28e485862265f3948e31"
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
