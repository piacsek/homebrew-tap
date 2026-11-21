class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.13.2/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "1f299d5620540a12a3b4c3276ae8615ae19e6ede82e4e9974342a807781f446f"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.13.2/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "984a367a07bdd3d02757f39517d0a440a9c88248faa3659e047aa18d88d28994"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.13.2/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "13d210ccfd18cd40316c403adce914bdd647a823c8c356f618defdfad6c5abbd"
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
