class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.23.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "254f519d39c24cd22ac1696982c48ec0b06a5509eb6bedd4f3f95591a5cc9e39"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.23.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "15b6630888c187941fcfe98f7ef7527e6d0c39d17a74d6fcdb0e0925a85ceba9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.23.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5693ef39f116b83d0caee084eb5775ce35cd3dc74a205809a96ff557176e477c"
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
