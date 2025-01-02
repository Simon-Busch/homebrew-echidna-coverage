class EchidnaCoverage < Formula
  desc "Coverage report generator for Echidna"
  homepage "https://github.com/Simon-Busch/echidna-coverage"
  url "https://github.com/Simon-Busch/echidna-coverage/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "e9540c9fdd42b08ac8cf94e4102a60025442d63d1f5183e18a9953c13143b15b"
  license "MIT"

  depends_on "node@18"

  def install
    system "npm", "install", "--production"
    system "npm", "run", "build"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"dist/bin.js" => "echidna-coverage"
  end

  test do
    system bin/"echidna-coverage", "--help"
  end
end
