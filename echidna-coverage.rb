class EchidnaCoverage < Formula
  desc "Coverage report generator for Echidna"
  homepage "https://github.com/Simon-Busch/echidna-coverage"
  url "https://github.com/Simon-Busch/echidna-coverage/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "a0a8159115076b949cefe5f215e597430b81a9c4b9155b744d098512cc6bc9f8"
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
