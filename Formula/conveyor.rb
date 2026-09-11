class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.11.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "2ef516c293f10739bca31ba0aac30b807030900676174fc181667f373280e486"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.11.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "15e8e4da309460f373620c3d51b3a0af807126657aafddead119e6bc6817c5f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.11.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e1cf3b63d5be2d6613237d65c223fdbfdec87b6eb1bd84a8f1e8b0b79382836"
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
