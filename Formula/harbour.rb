class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.32.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "9f8fb64ab1b7826d06967631435131dc0b33b765f9aa90d3f6996d1892d361f6"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.32.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "182c683f86b7f7a2cef6bfbd8597fcbf67e50b7686b853476c79b0df6773d1b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.32.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ee750a3312ce9b2a22787d88b097f33c89d94824a2fdfb4d047896271bee924"
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
