class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.0.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "5c78c24729b6d671a20a2591a7f3556174303869ac5d08ad3c215238751690ef"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.0.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "922bab555d7ac7c8a67535238221e61d9e898832c64076ee93b3a0f74ebd8838"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.0.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "553dc360e3c517296b47e90d6238d344f5103afbe1f642266dda269e1a46b5fe"
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
