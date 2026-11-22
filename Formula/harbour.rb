class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.31.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "0546d7fe8003ca6bb2f07e30a1f0b3a5ca270057ee9889b8fecbbaff3f999aab"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.31.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "c0be92420e817baab534b2a46ec3625cffc8a4def709021e3fa8bdfd3409390d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.31.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "439b163d5b10f2202a90e96408bee01333fe540bea806edf6c623c9d31d34940"
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
