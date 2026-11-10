class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.24.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "49cbdaf9eb4943052e040c44c2fa40cb9d6c8713f85253ca3f9b387cd9bff67a"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.24.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "59570f1460a40b4bc766a66e24176e809650f1ab4aca2e9c36ab1accd70cd9cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.24.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17f71a21967195fd04b6962a48211bad2febd7cd1ff0423cde8f041691bb4c57"
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
