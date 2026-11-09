class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.23.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "c812e4bfa7bec51f4f32c44cf85d2750a42c7644cae0e0bb833a2500031d555a"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.23.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "57534d1bfb18fa371dd7a08fd360f8a2ca5e42062bb23cadda85feebb1326ed2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.23.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2445b9cecc3a4a6f60be1f40ab410dd822caad8b67d3704ee39931f37f84586a"
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
