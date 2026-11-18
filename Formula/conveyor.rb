class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.40.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "488d1f215dde53a6724fff94252b210d856e804441a5857f40e08e8926fa0be4"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.40.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "148616a2cc659c5adac46409223d3465895fae61e95c1d42bca65e28eb1fee77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.40.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4aed92353449a60600f38551927675d2cf06fc63a35b79529bd052199630097a"
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
