class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.5/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "6b826b6b982722737835d3f9347b1e64afd1acefd1a4b31babff1f1e58ad7034"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.5/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "b5b91352956a10f73888b25542acab2448e19db934c28ff2012f8ae1ed77be5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.5/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f0aa9ff6e88132a5a2feece69cc30e0f716701499ef0e75babc8ed7e2dfde77"
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
