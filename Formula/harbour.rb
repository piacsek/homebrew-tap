class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.2/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "a55d66c457d8dc144d929716c8341cc31db5ad948a580c9b3818e43eeb7c48a5"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.2/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "ef21f43224abe37bfd9ce33e7d9c3a7c43b3fad226498b5a62bbb0b9835a6ee8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.2/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f11873d18e680c46631f2db27c70f070590e454e9d1574c7c781d5109b061e3"
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
