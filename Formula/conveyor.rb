class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "22eb87d1619651f78e36b1e4e35f8f17af8485fcbbce8b92f0e3b1bcbcceac13"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "bf01a248f1eb77eb3242723575eb1777594e3812f0445b14e7320789d39018d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c577c3f79d01fbcb58d0277a3311dfcb70a42170679f17ed67c6a3492ea93970"
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
