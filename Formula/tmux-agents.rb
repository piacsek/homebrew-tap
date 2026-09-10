class TmuxAgents < Formula
  desc "Claude Code session picker, status line and blocked alerts for tmux"
  homepage "https://github.com/piacsek/tmux-agents"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.4.1/tmux-agents-aarch64-apple-darwin.tar.gz"
      sha256 "76e69ec8d7eabcf02a0659aa7b85d46fb6ffc4db0613c2f93bd578c1455fe141"
    end
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.4.1/tmux-agents-x86_64-apple-darwin.tar.gz"
      sha256 "de76392f53ec64e06cb2402402aab8c71b3b960f0973792aa901fab065e9d3d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.4.1/tmux-agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e368b61a8ba6dd527c7a3f4f902c70588a8d53e59d7dd7a017b7344bc074817b"
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
