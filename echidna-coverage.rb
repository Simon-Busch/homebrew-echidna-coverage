class EchidnaCoverage < Formula
  desc "Coverage report generator for Echidna"
  homepage "https://github.com/Simon-Busch/echidna-coverage"
  url "https://github.com/Simon-Busch/echidna-coverage/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "4523eb25de7446f00b80f979b739dcab83806d8ea8e5d3fce184606ed63124ac"
  license "MIT"

  depends_on "node@18"

  def install
    system "yarn", "install", "--production"
    system "yarn", "run", "build"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"dist/index.js" => "echidna-coverage"

    # Add executable permissions to the entry point
    chmod 0755, libexec/"dist/index.js"
  end

  test do
    assert_match "echidna-coverage", shell_output("#{bin}/echidna-coverage --help")
  end
end
