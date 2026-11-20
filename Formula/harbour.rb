class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.7.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "9f782b481784530c99639ff3e735d3c954e110e1fbeae77e21b618bcb407d8b5"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.7.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "ddd98f5e21481a1a200bc5fcd15312629b81af788f0356b330327c7b906920e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.7.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15cd54341d4e706998e89ab98c99e09aea22a99a17738b9bf1d59415b7a8a944"
    end
  end

  def install
    bin.install "harbour"
  end

  test do
    assert_equal "harbour #{version}\n", shell_output("#{bin}/harbour --version")
    assert_match "usage: harbour", shell_output("#{bin}/harbour bogus 2>&1", 1)
  end
end
