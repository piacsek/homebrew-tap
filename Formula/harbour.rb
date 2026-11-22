class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.27.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "0433c3285b9341fb4b6b5fb10f89ab401eba10fc0b66d70191c7fb8c191a06ce"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.27.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "a16408dc0d13c77b897f31796fad10a6424340cd2ddd1081e6efb0b65b95d70f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.27.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4ca9bbd88f0d6afdcdf3a235fdcaa039173f058de3aea8da73f88e8c7f60a29"
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
