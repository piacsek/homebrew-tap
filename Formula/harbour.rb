class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.12.1/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "e1cd0e79c0dc90225fe3b1cc442bd14a67c8c15924b30afee631b636be0a38e3"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.12.1/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "c726c2dcebc91ab148237106dbc8a557b5b10582f2c924c4eaa3764cd7165866"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.12.1/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69e4ff46fa737b7a439b0e1057f4bc21ff75706deea4fc80f9e86a82f1bb858f"
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
