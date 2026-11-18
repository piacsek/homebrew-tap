class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.38.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "2566210e191c4b5e94fec6eb90a69f1922d387171e88a9b4ba35d9c8c16b8652"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.38.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "3577268c57f0c7e0a375f41c0b6b1ee603c42aca2396e9ab59a08909ef157a47"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.38.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b63378bc49b89cad7705c1acce4091867ee4d36ac7a0a124657c2533d8f55a3a"
    end
  end

  def install
    bin.install "conveyor"
  end

  test do
    assert_match "usage", shell_output("#{bin}/conveyor bogus 2>&1", 1)
    assert_match "[prs]", shell_output("#{bin}/conveyor config")
  end
end
