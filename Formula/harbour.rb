class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.19.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "a945ac2ebe4713b1a391e03b66f272ab9364707165982a3388be4f38b782cb9c"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.19.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "f1059ccf17cee87ab6620e598825131f50c6d0be8465b181166dad6627ae7279"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.19.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "38d9927e60a8d08e644d17b36ebbbeff5171950b93dcb50d4f536a9234f05a4d"
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
