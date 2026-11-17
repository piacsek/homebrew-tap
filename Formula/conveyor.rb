class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.4/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "11e8ac3fff9890865e6f7ac6be5d96d469735ea2f23d506ea8e685d7043ac33d"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.4/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "9cad998d600ba74c3a86caeb8a2e056948dc1715b7a010e3c14de9c06ff6efd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.4/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f52861a0b017e0e2af87610cc48ea41909d43ccb582e3595bd6a4ebefe39302"
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
