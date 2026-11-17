class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "ef053f83c89ed502cc06c920834fc4499c59ff9baa4d8cf06c294e25af17a3cf"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "3a3ccefa4700ebe580e76be39cf2d3ab5a028c9bb659d69b19f23a7f586c1d34"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe244d3284e801dee2a88aa792b387dfd28db14e34b0e27511fb9fc9e76a4bd9"
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
