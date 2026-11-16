class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.2/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "4e30fe4cfe069e55a04395214ffacd8db4911a626cf76ade901d986c201861cd"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.2/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "3cae1719136b428d02fac049a38818ec908230e5bf578a65ba3b8c28341800c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.2/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a507128435c24fc03cbd6a56bb535b82d3596da1e95ad957940810ff50d0ba4"
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
