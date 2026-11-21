class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.13.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "99eee377b51378de27393fe8c0af9f671599900567cf92b49dab471ecaddd8a7"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.13.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "a851280b51ee9644b45dfa71121071c529803a4d575ca23e6037ba826e9db331"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.13.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aba68eca2c8c8f5189d8b11bd4305864a5aac4e94291c16ba593e2a332edf053"
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
