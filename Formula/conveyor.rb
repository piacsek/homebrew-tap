class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.21.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "4045535ed9e68f009ff9d4120e939604760cca565009f2555e0cd9aad3e5f46c"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.21.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "7dfe0e21bef37be99730d1d644a6880c3878ba8099fdd102ff6f2f0322a0e653"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.21.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b187d0c0f2cabf3063c73a2268db804e28881483d40b961b8f3b141a2ca4c7f6"
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
