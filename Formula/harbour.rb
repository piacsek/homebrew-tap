class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.10.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "c2c194215221ecc4684cc315161abfaebef2ef299dcaa9de7e53a6e77d49d3cb"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.10.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "a2997567bd19bd9efd5f2e508bed58d0339ed3c4cbb8d0ecc8bf02719d53e12c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.10.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65a705af49cd3d43c1306466a6a237e03321cfb22738b8ebd56712245474be14"
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
