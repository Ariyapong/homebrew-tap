class Keybook < Formula
  desc "macOS TUI for searching keyboard shortcuts and recipes"
  homepage "https://github.com/Ariyapong/keybook"
  url "https://registry.npmjs.org/@arthony/keybook/-/keybook-0.10.0.tgz"
  sha256 "8208fa27d8d42f97aa2f202e95e99ce06066ee8773d1053bb0cb86b43d3332ef"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keybook --version")
    system bin/"keybook", "check"
  end
end
