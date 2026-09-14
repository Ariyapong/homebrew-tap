class Keybook < Formula
  desc "macOS TUI for searching keyboard shortcuts and recipes"
  homepage "https://github.com/Ariyapong/keybook"
  url "https://registry.npmjs.org/@arthony/keybook/-/keybook-0.8.1.tgz"
  sha256 "894ce664685862d0776a4a0febf65a6cb816574ebd6ef1bd6b268ac3a5fd922c"
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
