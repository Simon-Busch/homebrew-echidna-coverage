class EchidnaCoverage < Formula
  desc "Coverage report generator for Echidna"
  homepage "https://github.com/Simon-Busch/echidna-coverage"
  url "https://github.com/Simon-Busch/echidna-coverage/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "2760439497ce5b961725bf396826a9eb65bbf701355190cef9ea73283076da0f"
  license "MIT"

  depends_on "node@18"
  depends_on "npm"

  def install
    # Install dependencies
    system "npm", "install"

    # Build the project
    system "npm", "run", "build"

    # Install all files to libexec
    libexec.install Dir["*"]

    # Create wrapper script
    (bin/"echidna-coverage").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node@18"].opt_bin}/node" "#{libexec}/dist/index.js" "$@"
    EOS
  end

  test do
    # Test help command
    assert_match "echidna-coverage", shell_output("#{bin}/echidna-coverage --help")

    # Test version command
    assert_match version.to_s, shell_output("#{bin}/echidna-coverage --version")
  end
end
