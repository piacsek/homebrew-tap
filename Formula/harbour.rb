class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "59936a8cac819be0c4ad068a3335f2d72b2f5bc3be4055f461d059e849cc5478"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "7523f50219841f2a75c39486297c3958191428da680ea137bafabcef8e3e8d55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12a2425d426e8e7606c0334b27b4c4011d9a2010f7c51f497809bbc5347061c2"
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
