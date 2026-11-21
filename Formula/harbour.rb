class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.17.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "73554e41ae31d72f8c2e2d896c672d5482de9323afcb2eee2d326a1d7fb6d5c4"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.17.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "23f7ff870d1ef5b31b6c9ff05572575ba4e41423dc96756f81ac8fb8961b71d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.17.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b3a854d4e842524d6ee05efdc81c2e055d6a66f1546a690c0bb0d8fd84e2d2d"
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
