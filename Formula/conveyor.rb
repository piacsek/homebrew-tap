class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.6.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "5d0e6946e55a0b2f5b10627ed81a347b846b1475a688c8e90703cf852c49a5ea"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.6.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "6ba99f945c9f1195123994153db1bda1557e2f69c677f75065ead54d626d00ec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.6.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf26f199938ec234e5694e46a841251e8a290cf446a3b2b9f1805679187c16ae"
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
