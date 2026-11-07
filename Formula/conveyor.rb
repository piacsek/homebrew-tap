class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.22.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "8695226cb83082ecfa984e8481c20faa4989e10280596b9e16254a533c33c3b8"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.22.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "d9bd1480d1838980dfae8ead6dfa5c96a885739cce0788672868ede711c10b5d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.22.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "799820c12300a6f91f414e3fba2e3ea9c92f835c02860fbc1bf05b7ec005cae1"
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
