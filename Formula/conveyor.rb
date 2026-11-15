class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.28.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "5236e710b95405c3d4d7a69c3beeb41e309ccc8b54627363413d619d524d32fa"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.28.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "47a227907a379d3894a08c274ccecba2f7844d86c2ee52085e37e7bfabd9e424"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.28.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "433b2b6412771bedd903e4ec66fd9d42fe11f3a07ca99ae8f5adffbff78a3201"
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
