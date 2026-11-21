class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.26.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "2e536c4fdd54b2b1d810b74b114ae1a5658b821c05e1739bf51a8a85cf73c6eb"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.26.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "53a3e44004b45d7eccbff6946bbf4dbc64a54d66420323e1c587fe5c176aabb0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.26.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9494920013076b9c982a1c638259da3d7d02eb0309caa9f290cbdb73f1209baa"
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
