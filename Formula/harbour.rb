class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.37.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "5d04a4bb74c75422a9ea5bf8c2402646d24f1ab8dc03cd0f33c1853aea3f7dc1"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.37.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "775cedf3a8fc2d63452df78b31afdd15e1cd55853f6d10ec7ed9e65b3ae88862"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.37.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6cd4ef21d21ceeba71fce3f779774243bc889bda176272dd5dd092fc4e662f26"
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
