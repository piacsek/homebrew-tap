class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.5.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "0bd63d0d6aebcc6620ae9759d35e87ced3316ed7a28d5050fa33fcec228391ec"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.5.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "81aabe27c7d7cf2fc646a5ce0f497078f21665e384147950a0ef023fca28c840"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.5.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dccbcf4a7f240115b13280870dbafb2125f821063e7c5d2a4702a1be1b548eaf"
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
