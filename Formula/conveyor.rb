class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.1.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "43bf17437fe3e7d9c21db5b7ce6c87570136873105b796bbc39688288cc88236"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.1.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "42fd67501a7861cd90c4734b469f586ee7be79ff06147afe178604e008265df8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.1.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e4b1c750f4c2429041fc0a3d795d772ee6c53afc5df308ef5809231119da316"
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
