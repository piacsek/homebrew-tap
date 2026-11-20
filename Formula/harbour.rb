class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.5.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "664ce5deb4e39b711766855d2dd929e85277156c3c296f1a94344906a3d758d2"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.5.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "58114f27e1f377814c49a019c40c6291a792b87c51ec196074a7828ceb2e7ec7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.5.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d76efdb6252af74aa2929c3442ec5231b78a93e8dd01e14010edfe724f5a9d5"
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
