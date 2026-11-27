class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.46.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "7b8e9954d6d807bbaee13dd717c253d6bee4e2ae963c5c0e23038f5e4d5109c4"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.46.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "55abecc416eba54de0f671e242827b67b05ff6aaf1a2182397b9c3aad76baf92"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.46.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5508e37d9febde0ba488de010751421f3bbe57339a117118192f898b3a5492d6"
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
