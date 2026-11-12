class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.25.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "972a47885ab1a3d614da3146540ceba787054e9c054d026ecae9c22ee3b85799"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.25.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "c6d83ea7752d26675a481fac35d48eff184413eb9ecb14c55a7431676908be1a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.25.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab967dba64d1f89ef2350d01e047621e5d7018b8056197d8588cba6feff5e551"
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
