class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.45.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "8af9c7174a787430e6438d5070f80ad99a10a03a3a8571c0e3d96b3f82b6a86a"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.45.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "e5590a182f828c4b746802171f046deed593abfa51c4b7a2f81330d050043a4c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.45.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04b7daeed6cd8782fd71265489510c22cf0882b45178c68d9346de4249ed054a"
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
