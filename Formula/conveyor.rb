class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.5.0/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "188f0b8e563b8657c3e03d466105095269c3406ed9837b55efa5df5f171b287d"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.5.0/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "98046929461a5c8f5c47f70c137a7050f6a951512e48bfc0d9b29ecb2f1b20fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.5.0/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ca82bfda7c81043ca49ab45d978ab5ae9dbeba5e88c4f642bdcbf5009ce6501"
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
