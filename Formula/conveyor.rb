class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.19.2/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "dee0c83655940df49f27c39c9e862e3e39934958474ec2eb57212b5e9de4761c"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.19.2/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "ab2dbd9b0e7e43da95aad6bed74654e8945eb5ca14e4befc1e80e18ad7fcc51b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.19.2/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b1992f82044e90410d59fe0c18fc3ee04341243ee2465e0dea59809c04e275c"
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
