class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.10.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "3c783c047be04a1253aae5cb1d9da80bbf98ce6f71ad0971958fa649152aeeb4"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.10.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "e59a742df195bd83e1a7f4ba56400e7a5197393478802d8f6a49dbedeec7ee36"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.10.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b8dfba08ed63cbf569e55d684b9817d9b7384a18396eb02082f7dfed2211c80"
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
