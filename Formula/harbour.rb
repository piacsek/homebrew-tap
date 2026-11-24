class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.4/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "e87d3e416c64f9fe642c0762d735af47b790e1592a36ed7b7292f58a7cdf7cc1"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.4/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "3eb924494ddab99721f3c1a623eecea890f58a199766b27fc4d56dd70bf22444"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.33.4/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e753e617fffd063d84aed257840870ebf7c866754905c6e65cbe356d95c8fe88"
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
