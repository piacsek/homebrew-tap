class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.3/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "814ca521ee1732078ac76dde46cc1a1b94d089aba8249756a2de57baeff8f58c"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.3/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "2385c3f7aa2ad511edce31b083f7517d2f2f85bb725c96e397d43fdce3aefbd3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.3/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8fc4d683e0dc9384f8d7b3734fcca2c5f264f05ffdda913b1fff3df9937c274"
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
