class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.43.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "59f477723e018306a3fa79a07ed9fa23ee8cc3f4275aed14e573bcb8ae067273"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.43.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "af3fd31890d3daeda23abaf651e9c27a4eac03531c690a3058733c79a0dfdf3c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.43.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3515ad8527075d3b87fa6c141797974c20bd3ee750aeefb2762a7a9173eaff9"
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
