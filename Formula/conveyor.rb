class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.21.2/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "01225f11d0875c50617a84312bbcdae4fc3c39929ea53fe047ee33d6613e5563"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.21.2/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "bb113fbb8504e63dd50180d218dfccfc504ee4fe39e11c5e4b5df628defa32cd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.21.2/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4802b16b0fb0263dc5114197a1fc1cec9d8d8c79c84f95c58e0bd31d030450c6"
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
