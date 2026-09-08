class TmuxAgents < Formula
  desc "Claude Code session picker, status line and blocked alerts for tmux"
  homepage "https://github.com/piacsek/tmux-agents"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.3.2/tmux-agents-aarch64-apple-darwin.tar.gz"
      sha256 "7458202e24046d3723b5211bfa1940bc2a067c2a846efa49923e6936f926eee5"
    end
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.3.2/tmux-agents-x86_64-apple-darwin.tar.gz"
      sha256 "99bc8a9a0c47dbe39d3ac9625c1f6f1cb1d10079a9ab19db9a752aa48b8f8fe8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.3.2/tmux-agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15d91df85721164031e3bfd3f73f12e8eee57b11b594f31929edadf1c524c7d8"
    end
  end

  def install
    bin.install "tmux-agents"
  end

  test do
    assert_match "usage", shell_output("#{bin}/tmux-agents bogus 2>&1", 1)
    assert_match "[preview]", shell_output("#{bin}/tmux-agents config")
  end
end
