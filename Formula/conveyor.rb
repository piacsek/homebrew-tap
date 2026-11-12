class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.26.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "5ac22907e7dacae24b9f35441e04b519add60bf55c8a8f2bb14377ce84751577"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.26.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "744d8c4e90bf8b912ba2ed5cac41c9512e4ab25b3c8866abafd1d42b6e8cffe3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.26.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31c180df85ac1635a02514cbf8dae5f69bd386112e297b2489f19612b77fae1f"
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
