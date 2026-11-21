class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.12.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "408957b539a3ef22431d4d7a5dfde2e1eb78b28b317ef05de6c7c1b8ed52a6d1"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.12.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "261e07128e1a5f746f243a4e38f51c973b077cc4eaa50199460407d88477b6a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.12.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c86d05b450f678a5b5edfba92ec30af446142a959d87a2301eca54133d8882e"
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
