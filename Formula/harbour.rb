class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "986d43faaa6dd097595eec51ef61e5331d317c2f3490835c135c732a521786d0"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "a72364b9267c0f43f252e8a22ecf60f1decd6a5d421182e0a9e26686c536efbb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c17d9ec43b330e4c5d0eb6a2c1bd1d16829d67b45c8edc1743f98d7e5fddd59c"
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
