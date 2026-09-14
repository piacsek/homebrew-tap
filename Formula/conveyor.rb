class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.13.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "bbe93521f472b7fd7935d53430ddf4323222bc23a19577468fac1ad44e184cfb"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.13.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "75fcd74a885963b78093f0611a3d9c5ce9646095363ead9e48b6d6b8ee15ddf1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.13.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66f6a0fce0d9df7778b086bdd88d26e8cabdcc14ca12202c5c5d3211eb4a6c53"
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
