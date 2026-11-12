class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.24.2/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "f95695e90b140b128d278fd574dd0c9cfaacf2adcda6f236a792ff86c563b9c8"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.24.2/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "8ecdbbf2c45260a3098c6cb97e5dce15af51696e96fc736ed7396a08134e44fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.24.2/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68e044de986ee27a2a039a131a99e443c0c2b956861ec9ad92bc8acb4c642b1a"
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
