class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.4.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "b9f132d96a6842039d01be878b67c2a9a6e89f42026ba7404a7657df5c4c7864"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.4.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "80fb52712b1d4aeb9e22e757badb1e65b5b4ea99957402eeca9eacc75d97a529"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.4.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4db86216fa9c3b5ddb191820263bafa8ee542a10f5e2202140b96d3b60ea614"
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
