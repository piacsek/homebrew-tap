class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "ef0df3c451749cb6bae69796314bf7328eb34e1319220cd9121670623e7ea0a6"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "6f76e4957236ca6ddfe08e2ac277efeba312100e78c059872fff12b9c1f95133"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58404ee3f7e18b4f59003357c455507f133a2626057c13b0b2984d92d06e5d08"
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
