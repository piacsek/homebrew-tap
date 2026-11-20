class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.8.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "d4a0e1701d6fb67f0c3b1d40ed8af13dcb80cccd2fcd5bb4316dc5c40cc3fd42"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.8.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "8c1ead26bdd9a5e9f31f33c528258569988698a7da86f1ecf8f2720f49d29818"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.8.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44e84f9184107c290ab478083ef51b557715e39130a6629b01ea08687853af89"
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
