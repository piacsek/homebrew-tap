class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.17.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "52d4a9303be81e2742f5a6eb39214707fe568250174287b005ab571660e942d9"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.17.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "81e01ce4420fa9f334a0fbdd67a6f72c5dc79514d0adff3d9bf65d9a8c8e2fb2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.17.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f756cb528b303c46fae4b1e8c1cf0c21bf39ceb196abc5f939e96d2ac17435a"
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
