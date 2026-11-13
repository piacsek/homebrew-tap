class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.26.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "c0a60087d63239bbd7c338d148e82c90f0638ac8cf6a93ec7230981752863106"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.26.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "37ecd3bbd16605af5e76b9aad5d17295d5326823f80fb3fb6d0174c8c1e167e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.26.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ad4e9798dac217195761380ee3ef84d1a78f21d539573638e016f72f9219d11"
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
