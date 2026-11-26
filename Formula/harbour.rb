class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.42.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "b1b76ff6fb3d340efeb02da042059c7f8bc86a7a37d738d82e769d1d7e8a5587"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.42.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "d0399b94fe80c4d6203c619ce0851f1a981049cd0183ffd5a52e5a410c7cffd1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.42.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6464882459fcd0aa2d4b5ec5f725d4b62b60cb86bc7d525ab25d0a6b20cab09c"
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
