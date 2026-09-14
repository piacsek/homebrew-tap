class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.13.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "5be5648ece4c44448817be27809ef827f9fded896795c23be5e6588f7339196e"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.13.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "64a637b900815b9fdb49256453098d7356cfa4e6a2eabca1dc95906c6091b81b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.13.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c1fe405719c22f7a23567f7105818a33c0b83b5f44b670e3d681b04607e9b3b"
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
