class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.22.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "d82fbefaa26f0cd471044b2f7eddac4d09b08e88f5392df06bf3bc6977f15327"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.22.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "0242be85f8a4ac51ea16b78e551d1e91b53d34d76deb9062f276745ed935c692"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.22.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d606ca4c4f96dca15aeadef57b36ee06f6073467d71ecb18dde346bee53bb66f"
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
