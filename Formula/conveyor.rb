class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.7.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "c8aeaddc663938c774560eef2237c82cf67152f3e2ff64996ff368aeb571a127"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.7.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "0b972775b7f9a68b7635238f4163100ef0ee5333a5744a17c07daba0db404167"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.7.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "888dab94d939d78233ebbd6f549edec40b28f3c34a65ae12fa18dd3afee7f2ae"
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
