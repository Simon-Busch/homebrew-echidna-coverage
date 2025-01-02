class EchidnaCoverage < Formula
  desc "Coverage report generator for Echidna"
  homepage "https://github.com/Simon-Busch/echidna-coverage"
  url "https://github.com/Simon-Busch/echidna-coverage/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "4523eb25de7446f00b80f979b739dcab83806d8ea8e5d3fce184606ed63124ac"
  license "MIT"

  depends_on "node@18"
  depends_on "yarn"

  def install
    # Install dependencies
    system "yarn", "install"

    # Build the project
    system "yarn", "run", "build"

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
