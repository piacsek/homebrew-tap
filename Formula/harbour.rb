class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.3/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "298a6798a7fab7b4fcceeeabeb8f502fdd6989e2f0334a6b6f3c83719977cead"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.3/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "e7a7ab0674851212cc16935341183f9626158ff470dd6bf9f1ffc6dd59afa74a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.3/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4158571fb2a033800e5ac24635be83c62506c0b9cc2c00c9e9a3d9de3075ea51"
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
