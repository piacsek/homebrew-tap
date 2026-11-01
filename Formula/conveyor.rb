class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.15.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "38cea817cf770e62fb20d3dafc9fedb624bd2b13efc8349c02fdc107624a0b13"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.15.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "1c20e30151834bdf2a677cdd8d522ce4dc97089f61086a51a2c76db634f1900f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.15.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09f7e02494dc7a39c6ab07fa463ef9b6793a080a621d2972cb85def3d21c6b25"
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
