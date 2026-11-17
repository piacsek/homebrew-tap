class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.2/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "84c816947b13f318e6c7a76babbfa28537c4bd0e21c534a723307e67e0509161"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.2/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "11a67838883197091bfdb6a93d229a1bdd3a5885b3788836cbe86f27878bcba9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.34.2/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21f749d1125e1b1de2672499d9dcfce50bb202b026376f35acef4c1c9aef0c7e"
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
