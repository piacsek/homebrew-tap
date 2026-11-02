class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.16.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "2ef22a765b5f9a40786737d3b5542ebe123c29b7a44118dfa8b3f60fba536d2d"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.16.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "b8d842ce75d9e2fcaf3d436d8782f50740856c4a571899957850f7646548e07c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.16.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9f698cd7cc616b0580b754dbcf4e93a28361cc8796bd9e441b6599bf064461e"
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
