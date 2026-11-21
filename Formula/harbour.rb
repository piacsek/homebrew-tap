class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.24.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "27a74bac676ddf31d64ba6f15dc2150ecc34d3e361c5b29c3419b6f6705410cb"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.24.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "18b220d8a65286b5937c667307723c010052e85a0b779e80fd94c5d7b40a48fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.24.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ef73d2729cbfab97dcdfc63ce7929ddd22cf71af1e8dd38f3d09a50b86049b6"
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
