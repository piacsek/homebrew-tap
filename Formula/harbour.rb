class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.25.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "4b8570dd9208eb729f655add399652684718f83f92352f9a78376ac2d11e2c47"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.25.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "725d22b2283c7b8bba2cbd883bc563752b424cc583a50fa9e0303699b7268475"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.25.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b34906b086582142c0b9d22e8f7381e15bba048b50637423210bb4cc8544f20e"
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
