class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.19.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "55e655abe9bfab32faaf9d37af673593bb469a7255d4d76aba150bb9d485166e"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.19.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "a4dc4c047374aaacef49ef9ce5f5d559517ac75809ad7a6c187a8f146c0fc34d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.19.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "221eb44b4022740eed1bb5a209c949f0a1a8424fa27289c74f116c9519622d1a"
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
