class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.18.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "fefb19b1fa520153ef0798b3aa12436142198ba51831bfba680bd444a225b2b5"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.18.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "85f088e6f214505b7d14cd2f3ba5aca2191b96f387cae27af754d6c0dfe57a49"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.18.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9242f4ff64813c52c4056a74fa0b7827f21d8bae856ac0ed88a36401c1794f8"
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
