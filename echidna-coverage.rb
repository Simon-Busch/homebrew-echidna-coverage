class EchidnaCoverage < Formula
  desc "Coverage report generator for Echidna"
  homepage "https://github.com/Simon-Busch/echidna-coverage"
  url "https://github.com/Simon-Busch/echidna-coverage/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "316cbb5dc8e1342e601cc7aa27bef53abcb966e455e75354a14ba2eb6eb4a68c"
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
