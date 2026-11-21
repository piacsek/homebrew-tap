class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.16.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "dc8886003f3853445c817c11a33eb6ccb7cd6ff32d5069922073c5ea6ee2148e"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.16.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "93a28ddb5714d5cd14aaaa79e2a17af0dc8518db5b624f9ad0beafbcce13f892"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.16.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2dc3c093b89c759a063ec14647f2dd366088c3b4ec656c7eb86bbb2c3e4fe890"
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
