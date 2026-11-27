class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.2/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "b1ea58c1f90ad50a4211bbee26726f2cf063bff1b99e6f6a20224bfc2ed5aa22"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.2/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "6d3a0be66cf8d12e1801a01a9c235092622b9c57a601b6d77c5fbf6e84986f66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.44.2/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "acb60a519f0af54b73e75c907854abd4a473d9aac0aa14749d97f186d8a0febb"
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
