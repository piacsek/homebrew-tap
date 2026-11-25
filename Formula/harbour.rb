class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.41.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "776e1e7da99792eff8317de6aed3383bf8daf7029da023e8c2632897082efd0e"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.41.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "54b3f3f4c8e014705789f6e6d1991a7fde530d4ca7f1bc31db25c8b59bfc22a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.41.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cfbd46774b2cf4da894eba56ea5c597ea9115c987bae38b36c8451ddbe405611"
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
