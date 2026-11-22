class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.28.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "f0288ef9fb9a36f99c71a590604d789f24cbf470881cbacc3d6f4b36e4813928"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.28.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "1d8b54531487407b00bd3726f71e9018de0559ff7903591a6349ba14092d1780"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.28.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19797b8fa89f7c79f74024426d73aa07606aa0f520b02f6592e43cc16f080325"
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
