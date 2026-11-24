class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.34.2/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "91945677addfbb3395172bc1c3c943ac375e483bbab07785a47b5a0150742797"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.34.2/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "e57be3d1a24bb5af128b3934fb731ebf6aee4efbf749ad1c939e7ccc92404e80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.34.2/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac16aed595d3a053f86b65e2c689b9d5b42b1fffbff49b05988e4b1aeb06e79c"
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
