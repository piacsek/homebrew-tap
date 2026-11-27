class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.45.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "8bf620a0900cbe39c355607c29a03b28e1e72ec6611b4a723de4cf3b492d789d"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.45.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "44b68fc7f162e4df2cb43912d1428aa3f624abb6baeeab56bf1729c114b66a73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.45.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "630603fd70e4e95a25d74f5f13b7fbd73c766d2d4b848d81c7378894f7c20713"
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
