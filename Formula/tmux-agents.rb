class TmuxAgents < Formula
  desc "Claude Code session picker, status line and blocked alerts for tmux"
  homepage "https://github.com/piacsek/tmux-agents"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.3.0/tmux-agents-aarch64-apple-darwin.tar.gz"
      sha256 "63e369a6b4663275332ed645d777c2682cf96c47df57c15c109092436efc975a"
    end
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.3.0/tmux-agents-x86_64-apple-darwin.tar.gz"
      sha256 "839d8b77d25b2e562de4eddfef5bc2a55d56bacf4d35912636304f5d6317ee40"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.3.0/tmux-agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85aaf192feec24a8045e07b95cc765579e86554dabf3a31aee7b3f3e7a79ac89"
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
