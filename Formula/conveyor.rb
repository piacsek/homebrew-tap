class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.4/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "9a32f1b3f9a2ba5e397b58c350504216430af108287de88cec92e412d051c631"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.4/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "db8b2ce087a0c0341dac22236aff0b3632d420712d8be1ab373ea8cde0369fe6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.31.4/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6998b7645ef2802113ad360fa878b15ec5a0ad3b913a8dada15a8479aa41e09b"
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
