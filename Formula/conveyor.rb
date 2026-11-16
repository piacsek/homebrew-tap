class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "216e56258c25f46349d930abcdea96b1bfc803ea737e872903f818d0df0b7bec"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "9daa52b19e8985ed5f4de71a2933f85348033e9a5183777302deaec54662d34a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef145096e759d6c4298aeaf1a9fa8b930c5ec556ce086c11681c109116182ced"
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
