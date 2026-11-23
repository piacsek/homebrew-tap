class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.3/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "9e3f2fd8ed74c22f0df27b514ad7f0d400fb82aa67ffe792889da9fe52f60889"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.3/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "b7bd19693eaae2b83db762f2845f12a6de44995c5fa76f25a1bb666c502b346c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.3/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "02c34403ea58a8396cb3822ac8aec519dac4216e0e109a94b286af375102a02d"
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
