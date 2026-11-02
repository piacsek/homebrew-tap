class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.16.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "94837979979052298ecd0746b1006f32f5839daf6dbe66ea5824a5737279cf2a"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.16.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "df3bd9a02bcc54c2f5e2e3b753c03b06263269552cd38293350240bd1b2aeb52"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.16.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec0df3667355d28bb33a2889fbe3448bdff211b468e5de17ab39a21b0fcd5fd8"
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
