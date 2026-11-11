class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.24.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "a4ad5bdeada6ba4579b7cbc58945e65348a1800d202bad8275d7b63e6e2b7846"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.24.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "d8cc9366e9e3fe3b06a9d412bd8239df0d2c2b1171ae181d1c4109544fd8c6d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.24.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21b9dc2ff4ac56bd77743c5161e001305b00064f4a99a1009c8489e3fb02388c"
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
