class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.20.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "0ffa47e6943cd9edbdddfcf1755449862be99ad21e3309a68a96b0dc5def16d7"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.20.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "95dbfde1022e80bf47f25fd7d1d3aa8eea1572f4190a3ff9526625327cb1d73e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.20.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4446c12865b562cfe3db893be806d21e27573b16afae3daf7f4ae26b4ccd4cda"
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
