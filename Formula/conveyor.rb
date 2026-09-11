class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.8.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "2702be2349fe5e2925909cefc2e72486e1e15e71165768d83b7c093a6f74e581"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.8.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "f06c5ae08a37e39ef9cb9a9b872cbe1244674289a1ce3c91aeee997eb546510f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.8.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd1d83d25840dc154dfed649336df17a3bdb6175c7d851eaf2de29d7b10eecc8"
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
