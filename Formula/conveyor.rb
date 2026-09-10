class Conveyor < Formula
  desc "TUI for the path of a change: pull requests, merge queue, main builds, deployed"
  homepage "https://github.com/piacsek/conveyor"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/conveyor/releases/download/v0.0.1/conveyor-aarch64-apple-darwin.tar.gz"
      sha256 "44b580dcc0169df94c7f93103adea1124f89e0e7edcfa3be27d29081b7a41960"
    end
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.0.1/conveyor-x86_64-apple-darwin.tar.gz"
      sha256 "7a8b706c3075693e5a456cb0d2359e423319ebe6d8f82e3d9dd7f5c17d2964ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/conveyor/releases/download/v0.0.1/conveyor-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15c0cb13ac93dc54658352f7a14e05560c27e385059673949feb73ba0cf8d3c9"
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
