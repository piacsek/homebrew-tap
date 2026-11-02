class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.20.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "f06d4b42e2f22e57fb7aa7206792ba27254f832b94dc91a68a21385a0f339e2a"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.20.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "eaf421ba3bcbd1ec2066bb772d712fcf112286c2a45fb56fb91331d17203deb2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.20.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c181a9cb52443b105a0093ffb279417a9a6f9e488673a4398b6b7a43ddc5987a"
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
