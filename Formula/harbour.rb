class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.11.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "135aa1a5c6e3866754b4250802882ae36bc598449505afad7de0d49e22cbd557"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.11.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "270c361846caf662760cd505c5f5927cd5aeea0dd9d3ad8a244dd364680fca29"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.11.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32107c7aa9615e962101d29023c267b8643810ac6e5fdc892c06a8e623c100a5"
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
