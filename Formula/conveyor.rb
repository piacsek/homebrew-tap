class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.3/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "59aba4f9c1e6eb03eb84a5825273b07c49cb834dd545254bc39c5e21421ed294"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.3/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "c65c9ada272bc3d01fca4f59902edf02b69acc960585630f4363e782803171b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.3/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a41c04f8e91d74ab4349af62c341889cae0b057098c7ddc254272a58796fc82d"
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
