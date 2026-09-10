class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.2.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "70b7bbd067a3f9b71aef8e761d6ecf9b296fa2171eef70bf56db758278535988"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.2.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "9cbd06624bb989d6066920e04701cd06021d1cf0e4d8987c1c640b79c6de6c5e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.2.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d0900f04073f093b33d7bccf464851f92d12204fe4029e7a552d86ff41d40b0"
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
