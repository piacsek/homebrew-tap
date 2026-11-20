class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.6.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "86603592139123eb48a98470a865e6ea79fdee8c20fdf2bdeb2729e1ba04f3c5"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.6.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "62bc5a7783cc0fca5f513922316631ff50d31f7f0d82f3feb72873fc48434c80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.6.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9425ef7740d2a9e97817ccbb28c94038768a1f6ca50df3b525d705889904e8e7"
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
