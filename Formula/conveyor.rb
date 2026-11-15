class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.30.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "acb0ec101793db91918b4c109641acd7f4d5fadca952b5d7c17b7230788160d6"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.30.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "5c5df71f6f9a1b1423bd689ec073d2393942c281b6607bb4bc1ce512e5960503"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.30.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d04a1de3c931415b3fe03242d4169124b04c912b2f139a631a68e55743b46105"
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
