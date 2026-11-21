class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.18.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "f750f9b2bc89fba58ffb8d4d9818b8308c6a7336325be42595397544c29a7524"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.18.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "974bae70d96988d1a20553f3cb3a3ca4afd50f42772faae7c726b32ae7abd10d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.18.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e6f0afac1b52d3bbb376c1692a2497b555793bcee879d6ad2a2aaa711f42bb1"
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
