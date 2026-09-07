class TmuxAgents < Formula
  desc "Claude Code session picker, status line and blocked alerts for tmux"
  homepage "https://github.com/piacsek/tmux-agents"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.3.1/tmux-agents-aarch64-apple-darwin.tar.gz"
      sha256 "a6852bae89fb925792e9f7102d39629915c51658a5bc7a90e28c626dffd11553"
    end
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.3.1/tmux-agents-x86_64-apple-darwin.tar.gz"
      sha256 "27d8bb2abfb017507c005609c4a632b83c8d62a8786d4635b6bed1896197872a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/tmux-agents/releases/download/v0.3.1/tmux-agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5bb737ef352405902f2d160c97cc72c3c10b30971c370a28a8baac4f6de1a57"
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
