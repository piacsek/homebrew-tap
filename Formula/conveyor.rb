class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.15.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "de6540b810c0d6cd010555b778f10829fcaed9903b71a3f41e39dc4600127a40"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.15.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "a7d31b5818e6aacabe0acb74a600d128b7082bbcd2feca25093b0cda434f6883"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.15.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca6f33721eb1cefa9bfec5cbd19b131988325fcc6ef239ba7b02345dbc5f64b6"
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
