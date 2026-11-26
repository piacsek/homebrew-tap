class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "9d05628a728f97fdcec9da8f5426aba3720041c210a64b0a21fc6896e7ab3cf1"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "e1936fc3698802c94fb034ec63eb3f9d84855daf9bce2059a94d60b2552d9b7a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "36b070c2789bc5720fe4685d39cd0c61554983a72ab723853980f7b62e005905"
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
