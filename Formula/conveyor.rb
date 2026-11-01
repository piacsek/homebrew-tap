class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.14.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "94bede8f76252fd1e96af2d6ea0b4e37a5950121ba96cb7de70413c7aad65e5e"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.14.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "35a9e15d75cca003764eb09a49f45e94e642765101c6a1cafdc851daa086c20a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.14.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7881312f2dfcf37d8a180a8e47ce40347e4922e1f96d6f5705ce55295852c4de"
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
