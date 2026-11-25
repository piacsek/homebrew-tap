class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.40.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "6853a6d8b3a80d1079cadbea8733a0a1358d2921bde3942c70e33debf7ee686c"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.40.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "854d8dd1e0e1b22e1a1c8506c4b9bbdb7fc75271b2947f6a60ff3a73dfc107a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.40.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c50c4afd1cac76bebf98e58d7db75382872e27c1c5c7d1855ee5063d43fe80d1"
    end
  end

  def install
    bin.install "harbour"
  end

  test do
    assert_equal "harbour #{version}\n", shell_output("#{bin}/harbour --version")
    assert_match "usage: harbour", shell_output("#{bin}/harbour bogus 2>&1", 1)
  end
end
