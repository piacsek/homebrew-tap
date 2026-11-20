class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.5.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "febd7c58748a16f62e5c80ab730e1a3ea35a9cd0c7bc4adbdb7d1e1b64b38273"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.5.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "d2d7ba1250e1809c804cdb4fe37d0bc7066ef1a51a1b56cafc89bb85b86f4f3b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.5.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4375db731a46b9748c082950af1ddfd4ca8c1c26bae5b6e07579042cd071aafc"
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
