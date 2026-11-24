class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.34.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "3b6a33c5814b1461c59ff65c7cd64e274a0510be780fa2a7fcd399ddac8e9ce5"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.34.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "b77cf591a362783304e57c1027cb16368b09df1b9de8c544a14709844b1ccd97"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.34.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c003cc3d5a583cab76ff0c654be28672b43f71c9365c821839205c2d80e7dec"
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
