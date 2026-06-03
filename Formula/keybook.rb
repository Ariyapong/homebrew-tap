class Keybook < Formula
  desc "macOS TUI for searching keyboard shortcuts and recipes"
  homepage "https://github.com/Ariyapong/keybook"
  url "https://registry.npmjs.org/@arthony/keybook/-/keybook-0.3.1.tgz"
  sha256 "f1f19b4120151b567a3a8aac9edd5955587e917031199ac43612ecfd4ddc5c2c"
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
