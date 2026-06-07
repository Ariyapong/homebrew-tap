class Keybook < Formula
  desc "macOS TUI for searching keyboard shortcuts and recipes"
  homepage "https://github.com/Ariyapong/keybook"
  url "https://registry.npmjs.org/@arthony/keybook/-/keybook-0.4.1.tgz"
  sha256 "e250b5ec0f7b847937aa1f92d5c80d3c3023f77f5aedac13c8a729de8c6bf2d8"
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
