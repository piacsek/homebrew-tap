class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.35.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "294f31ddcbe44fda01147d9d3aecfea16c3e809bdc5b11bd6b7e2a81749ab660"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.35.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "f469abd3650aba8e39f71b96badfd720a10606539a9370ee4f240a2ca17d48b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.35.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f693743bf65cf6854e4c7328961d52a4dfb276ed750f49a8c9cfa8c927f8e6d8"
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
