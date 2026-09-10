class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.6.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "f81cebe76155da016800f939e5d558fc6c615b0c8e67df03bdbd996239f4fe9a"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.6.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "b386eeff8891e677137639377c627185569f70f5b214a7f85643b0f353776697"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.6.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9bb45e21a57a003f22c0efbb554f41851e9db2005ecde6d9b6576fcc405db63"
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
