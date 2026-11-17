class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "f6d0b5bcc4d235209425d321f22c27095b07a61f0c48a9f1062c8360cb976cd0"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "9f664b49cce4f5ec793190f2055a6929daf92c4b5c3f17df6bd8b619094da9c7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.35.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54fdb36ec8adffe621fe30736ae8f5b953c745cae0aae0ac0ae46fee84359abe"
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
