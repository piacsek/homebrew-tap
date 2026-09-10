class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.4.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "be229710acf3179666804d29561fc7a5b3baed6a31ea0ad5b46f56c1bd84aba8"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.4.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "62df81c26fce2f2429b71ea67a5bb4938779d8b852269e9078be822f26399ae8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.4.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82b298f4dd51f13aa17ac88b270dc42936f2808c476e3c021daa14037576e48a"
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
