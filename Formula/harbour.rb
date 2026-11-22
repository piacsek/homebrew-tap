class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.30.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "3480809e1d64b628df672e5ec6ee4f0affc46e518a6a5c7cd14013fe8e070758"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.30.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "34254971c8fdf7ec94a7d82088022e354ec444a5488ad9a9d88944af1e9a76c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.30.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32629c4d8324247524323a539f5183c2f189c9806fa59394a8f2fa536c8b5ae5"
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
