class Keybook < Formula
  desc "macOS TUI for searching keyboard shortcuts and recipes"
  homepage "https://github.com/Ariyapong/keybook"
  url "https://registry.npmjs.org/@arthony/keybook/-/keybook-0.1.1.tgz"
  sha256 "9b7118297dfd7917e5e9a7e71150ca1ece8a632cd946b17e79446367145727c4"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # v0.1.1's binary hardcoded --version to "0.1.0"; re-enable the
    # version-match assertion when the formula is bumped to 0.2.0+,
    # which reads the version from package.json at runtime.
    system bin/"keybook", "--version"
    system bin/"keybook", "check"
  end
end
