class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.36.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "2a13bdaaf9a21766b1fcc779f59e776315a94eb13d5fbf0fce7dca127718818c"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.36.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "2ce639ac2313da8275d16d6c515ef5e2927949cfc47a5dd959e0337f421244be"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.36.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c466c79e850eaf554e41bb74ade17e099a52f674e05300bce9c1eb92f3116fd"
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
