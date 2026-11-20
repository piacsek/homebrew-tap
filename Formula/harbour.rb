class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.9.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "8cdaddceaf6b40417820b8b1e086a922bfe05e980b1540ce83c97909671c19ce"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.9.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "f4535d9ec9a19dd32cf3be7d6c55b6747d96bc81050dd0f78219e351457709d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.9.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ab23e6ea0d78954d1d93fff49d1f3957c1a5092efae757ee85d1ff3584e9c45"
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
