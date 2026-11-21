class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.21.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "28b2297d7ffd8b8f13bdc3138641b676978b6d6b9044f36ade3495fc253a3b37"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.21.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "4b578c1bcfc5ce52e8b59249769401cf6037b79ae8334bbff3ceb6e114d5889d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.21.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f7b9e39b160bed7fe7160cf6a80d266cc05e753a9c7f31f6eb8dc7f7e5836a2"
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
