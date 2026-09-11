class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.12.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "c737ed738f6bfda4cccc189214f94ac40692584832899eef2ec700aaa6f20ec0"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.12.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "36574de7a94f0ee9d04fecab153e9723c85d5732580dc6e9e8bab89157c3156a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.12.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09a0088f0cfa1698aa2e8aab186acb715c21195d134da292fcfdff8fffd63f35"
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
