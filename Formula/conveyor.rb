class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.12.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "0cbfb3be52f2d4aa0704ee72dca126c2099ca6b1e2b615a4ef06450f03aa422d"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.12.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "4e049e56941764aaa0b826d3d2bd47a09dd2530a3b4b2fec7d65e6589ae52add"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.12.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef8fae0c12db8e8077cacd295da975b3ef991953c42c88078ad0c88794a1ea9c"
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
