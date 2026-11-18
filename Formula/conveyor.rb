class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.41.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "bca77853f7e61ecd192ace123232962dfcd868caceb9ac99da6220b4170a7765"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.41.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "94f8802e6b98e2bc0e08f845de9aae082391caabf67132b81e4e1cb88dac9f26"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.41.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c758bda7f90d85945b829482e7e34b69777b0a4adae1f4cd9fac469c4e94a9b"
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
