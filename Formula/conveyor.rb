class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.0.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "56774d3786e152f97725be6b87e582dd735ddcba33d1257cad80394bfe28b2d7"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.0.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "7e19ed558b98b9d9f7680760b532ffd32f77f965f566d22e9285764585269bdf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.0.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d0979afc424f61dc04318ea9785b09f633162bd721a76c1a5675d6bfe725374"
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
