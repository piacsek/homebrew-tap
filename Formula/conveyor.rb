class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "335af5e042abc7b8e3bbef8f5f5b5172529b06464338adaeeb2be856a5e4e361"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "d05b96037881dde33da5eba910ecd289c5d44c4ba1982be09928810a89817b9a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d6bbfe7a816e6f4c3dddc4be2fe29e3a9ba7ad7e7acf6d6786ff43cc634533d"
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
