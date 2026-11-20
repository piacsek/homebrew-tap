class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.3.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "b351162c5fd738746cae99ddde0b96b2ace0a3b42c97fffaf46913e9310b0928"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.3.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "b023c510268b02d71175ac6f434036a22d997a435af18d352981b4deeae72141"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.3.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09c35d08a255cf95145dd08f262c1fae31eb74febe21a9c7f5bd1b22c5adf57e"
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
