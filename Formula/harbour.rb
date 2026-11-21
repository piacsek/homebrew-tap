class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.13.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "c7d0cb969fb9aec894f786e1830427b9f89ea7b7335a917c94baffda9a9604f1"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.13.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "ba0e28c066c42cdfde2373222ecda549c5c281c94d9dd86b99ba4600e81cd7ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.13.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "574e47ac0e5d7cc19a796d60ef6ccee64f1ec3209afd00d4be63a1c2f9d85297"
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
