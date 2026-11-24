class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.34.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "5c8ded16bae6117dbc7d8791c4e2409e08d89552ca8782bcd9f562332ef62576"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.34.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "f82c044f08b024492ab2ff3d6f9bbc3ccae837d20470ee92c7480c3324ee7cfa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.34.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e87579329a734729a62b106e038e232382b19e9584cbe3ec8543f94df86c44a6"
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
