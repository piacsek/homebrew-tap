class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.3.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "5450e272065289106cb974320d8ecc8ea3b8c020afcd06506feec04c2ace26e5"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.3.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "6bf0df467da7b02519db94ea66c683d039f436d78f1581dda407889bccc0607a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.3.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d881ad7cbf63c73d8cec3efd3eb99e532da5b4ff4dda5809bccc8ccbaf118b84"
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
