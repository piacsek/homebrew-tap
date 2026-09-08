class TmuxAgents < Formula
  desc "Claude Code session picker, status line and blocked alerts for tmux"
  homepage "https://github.com/piacsek/tmux-agents"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.4.0/tmux-agents-aarch64-apple-darwin.tar.gz"
      sha256 "9b1799fff914cf527ef870dfe93045da816712bf4e0321d677604a6b39171dd8"
    end
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.4.0/tmux-agents-x86_64-apple-darwin.tar.gz"
      sha256 "95221e3d564b7cb64e208832702f235862722ec40853fe10f0e3af51eff011ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.4.0/tmux-agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb2e5d3d5350c3edd81c31e86ccf5367b363364fd1b495f3968105cd0a1975e1"
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
