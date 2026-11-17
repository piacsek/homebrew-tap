class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.32.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "1c5424c8fa2991b2be2bb80e1f65746803d49edfbff8eadf7115a02886f4c5a7"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.32.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "0b99ea2639ba076020712e798b60a50d0da39be9450c51b5824d6d2d2c4393c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.32.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a266f835eff11f383a38e5ed0b43594ef2caee058eec9f4644a281d1807c21d"
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
