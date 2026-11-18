class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.37.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "fe7f032bc61c818648f4591a5fbba9067b3b8a04f305187aadf0b294e58f4d2c"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.37.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "70e019fe36d355d79e917a1f8b9d2ba2e59edf8e084268852dbdaccf310cdb64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.37.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d86c4bc7209762030f8b8011f96a3ac3edbf0ee1e338dce46fb4cd47d5b7504"
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
