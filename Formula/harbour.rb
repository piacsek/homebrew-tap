class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.1.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "3252d1c92326061a5525e01f596d94dfd486342750cea5d005c7feedc8864678"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.1.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "28b38a79a66c5587bfb794a02f3a4a8b31926d55ff7a01f2e26b4163fe5297c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.1.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "030ad863f419423e5072b594ca8ddfca44dd5e61232e74234a2b8a80c7d044fb"
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
