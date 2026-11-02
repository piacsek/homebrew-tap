class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.19.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "e70689019a981bf9651209d0141c98615e35b2a96c8987f599f2f8a74869879d"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.19.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "20cb18f0a66fd366de4f04725c07fe6fa93d18172e75857263299937ac536eec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.19.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17e9b3fb4de79e8cc64085668d0f7582788fca521554c349ccbf89419d8ea215"
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
