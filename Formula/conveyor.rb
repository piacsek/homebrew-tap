class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.16.2/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "a138bd90195a5b9f6ed4b9f6aee05719cc3fdfcdeb5a8665aa8262c7707e89c1"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.16.2/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "68e5a0a97d1ef31f9890ecd5662cbf90991bc66cc88a32cb55979b0182bed519"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.16.2/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8f21d5839c6f192edc3fcc3f14462884ad7dca339339bc8bf160122301b8199"
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
