class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.38.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "72231c56d627f046891daa403955a8031f29d3d20bf75c2af9f052370c7515e6"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.38.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "4a27edd0026a9a8cc0198bc4912b0fc4efef4fcf20554379631997caaadeead8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.38.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ba09bbccf52914302e53444ac732abe817b3cc0bf7abd90fe884d600a4fc8a4"
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
