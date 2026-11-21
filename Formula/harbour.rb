class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.24.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "c9310d43db2ee2a5a214e484021d54f6eb415b7166d1f6e9e565d14f36c618a0"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.24.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "e16c5f9d303b1977c05818b95f5c7352a037c8b45d8ae55b435e3ab6dc9ee6c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.24.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a8ddf6cbb1ab74559feaec367ff7bb106bf92753a4479eb10b0aa17ab0efe8e"
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
