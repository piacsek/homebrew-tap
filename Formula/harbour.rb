class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.2.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "39d09c19f16c0032ffe49c9fd05c4b9afa1a59fc5bf52e910d6f130e8a83493d"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.2.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "9d66138b985fed96c15db1b929863480ddaf99f3e78dfa6d8a705dfdd7c3382d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.2.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ced1b8803c1fc31d613b86202e93bf4f029242c936fea8579c8890522c39945"
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
