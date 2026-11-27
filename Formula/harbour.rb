class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.47.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "b16e71594db104a4bc38467aeda253ed4a7239d9aff3c3b639fc7e53fade0c59"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.47.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "66f809600bac1ea04f40dda455b8861769d20d6a35c72dc5c97b0bb11e88fba6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.47.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c770cd3bb35c8ac83e6618448d58e9f7558373fec5558427bd1b448e03b3fd3"
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
