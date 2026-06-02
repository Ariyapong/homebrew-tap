class Keybook < Formula
  desc "macOS TUI for searching keyboard shortcuts and recipes"
  homepage "https://github.com/Ariyapong/keybook"
  url "https://registry.npmjs.org/@arthony/keybook/-/keybook-0.2.0.tgz"
  sha256 "bd4a6eff70675ab79f6c1129736d84be77d6ea47488090c1c1adb44938e3a056"
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
