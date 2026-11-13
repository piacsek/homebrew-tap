class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.27.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "ab3c961f59bdd8c9b9a81d6e42668e56f138a6fefa6448e8113f952f8cf4bc6e"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.27.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "77abd98b19e8ead380e51398eef21ae6bdece2c8eb964bf50c4c035152ad9633"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.27.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78219a366b0015a2416f611fb3a1f2abb76878381eebdb71584272dfa3e1630e"
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
