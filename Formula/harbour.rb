class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.15.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "65db31bfcbee83fd3ab9897fedbee9fa265731cd0dd2b8112d6851ecd44c225b"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.15.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "f60d4a206e2bf242572c63bc11053ff34fc6df18ac5d76fc146059f865960485"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.15.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30f55b1487186abc2503a23d4e9ba2647e21f095b5386a005ab815867fcd109c"
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
