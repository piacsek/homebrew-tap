class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.33.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "e11d91b9a122cfd13deff760282242a28306b816476d59b207cc777720c8ce74"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.33.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "b1b546831e4e00ce71910a93fc826005b797d78f312f531ab6aa7b8653ac6e02"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.33.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dbbf60ae51aa8111fcdd82aa27a8a4ebc61838135121c227420b41bf3bd960fb"
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
