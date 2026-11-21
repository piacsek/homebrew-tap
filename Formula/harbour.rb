class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.16.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "19d2be5fe48454c6312d6926fec999517e61cbbc4f66b022c918e336c01b28aa"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.16.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "06642d2c6834a310d59fa449e25c2ad4f5a6b8afe8480e9f3392248ee20889f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.16.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15a9be6b398f067692175611f29ab2542f6084a0138b6da50def3d586077dd37"
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
