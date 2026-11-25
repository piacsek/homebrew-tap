class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.41.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "5ad97b376a35b587c2c900261cbf5926723a6fd65889f98853df766fba98999c"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.41.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "3571c3639918351935e1a28e707fa366c44332e9da7bd83932fd22d799e7bf6f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.41.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e065b651710824895e74f1fad5136ba9ba510c077ba6635db7cc5344e386dfea"
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
