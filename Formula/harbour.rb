class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.30.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "14919585a0fd90aa50fbab4ff226a352510dd3d208f32efc07e5efe9159aab67"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.30.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "fdb2c2d4227a6017537273dc9756b2bf69eb688deb6bc5ee5707e417b252a50c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.30.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "546b2046613e24d8a424fb2930650c0a0478d790d6aa71fa786e0a0329f6b951"
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
