class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.9.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "6e5dd91679eafc1e9be00e93218dbb11d51891356b63deac4e10824ca1f3ad74"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.9.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "e68394a3ecb8217e2444781117dc0d86583faecd63957eb74be1e88b81002242"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.9.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b2f6ff1b5cdfca036896907ca9583825e59d72d1bf6338e8ad23fad531a6eb2"
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
