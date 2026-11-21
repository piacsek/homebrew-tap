class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.14.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "2ef274c7b5073422883d9a83fc1cbb2808b4a9aaf533ca4d0e694cc0c48f165a"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.14.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "c8a7d5322a5f7f6abebab9528585ef33b581f897e2f763bd1b80de014034f555"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.14.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "942c02c797ba82b310af713191fd2f0bb1de1588a8bfffac25768109ac81c544"
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
