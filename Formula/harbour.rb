class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.39.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "79d09ebb44717c77b7b4c7f5529872f889d9a722df12e527908ad42bca4f50d0"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.39.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "3e171a72bda380d27c4ec1a0dc4edbf31c4419d0f15ea3daaa67837051f9f9df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.39.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70ab82abf1261a956e4b7dbeafed59787a44ac9185fd942b390c68202a490a4c"
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
