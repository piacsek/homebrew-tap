class Harbour < Formula
  desc "Harbour: where shipping begins"
  homepage "https://github.com/piacsek/harbour"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piacsek/harbour/releases/download/v0.29.0/harbour-aarch64-apple-darwin.tar.gz"
      sha256 "120291a56be37bbaef816df5ead0a5c1769a6faf505b5be5f4c79de4c61962e4"
    end
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.29.0/harbour-x86_64-apple-darwin.tar.gz"
      sha256 "16a7edbe74353972aa3ac05f79c493551b8645be435e26b8e5a2f04831f9c570"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/piacsek/harbour/releases/download/v0.29.0/harbour-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92b044b3e91b3b48de05be90f941edb7d652d76f4cf47d6194c806f2f38272c6"
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
