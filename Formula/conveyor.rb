class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.14.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "5a849237084d0b0ffd89de1e6277886877c60dd72e17b2e429fb7688af71b7aa"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.14.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "0c3249fd514d101952721637e3d5fabc718fc3faaab1f083ace7ae045f2d9c77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.14.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "599b7058dd0b2a27ac68ad597e2d793c5b57ebb654cb62a660a4cbe4da382f73"
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
