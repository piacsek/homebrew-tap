class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.24.2/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "0d921f17a3c49f80ed657f4029d1aa0b4fb966f595493d4e642be11b2a50c7aa"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.24.2/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "65a674c7000f95915ed8a86a281b70530c792fbfbad999daa423cd3f8f376eda"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.24.2/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3895cf311f9e53bfb75621bbd77fea44cfa76997d8019a400bfd3c7c7147a938"
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
