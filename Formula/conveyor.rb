class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.39.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "349b433b4719c0c4d5919616ae7f2717197c66169568df60f7f9ff05db603519"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.39.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "11879e3074e2a4d371ff57923123ecc5b26e31dc246bf6be31572de22f1f9049"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.39.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0fd380e977469272a7103e0681c18e3d9dfc49093ad55ffda44fb766e1c5bbd8"
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
