class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.27.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "37237ee91b7a183baf0c48ef57007dcc5530bed59d351051edb9010e188c9b4d"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.27.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "cf200dc23e8069252fa2886a07c64539c31fc53645593b3bae65803f51a3b5cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.27.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "167c02e2c16aa6e02cd87553101cc3434475e7ba53a4b0278f3c3d59e53832b0"
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
