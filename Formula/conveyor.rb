class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.23.2/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "4abe2d6c3202b27cd858db1a7f4b10840349f842606c4c5873a6e272a0716821"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.23.2/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "07cd1065e09abc28e0afc8ae08f52fd24cd9043cf4769f75459ddef59a44ccfd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.23.2/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71d9af0a35dfefa8502a3ba2c786381ad21e7bdcfa3697296835cf1dee770d13"
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
