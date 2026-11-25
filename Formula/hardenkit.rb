# Written by update.sh from the hardenkit/scan release. Do not edit by hand.
class Hardenkit < Formula
  desc "Vulnerability scanner that ranks findings by real attacks"
  homepage "https://hardenkit.com"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hardenkit/scan/releases/download/v0.1.1/hardenkit_0.1.1_darwin_arm64.tar.gz"
      sha256 "1e2256ad044a798e97cba66f78ba7e9a9df2fd6536415780e03475fec8a612e2"
    end
    on_intel do
      url "https://github.com/hardenkit/scan/releases/download/v0.1.1/hardenkit_0.1.1_darwin_amd64.tar.gz"
      sha256 "b952146960d235db490fd7a7e6cee641d88f1c7c7516d20850c58501e10e4baa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hardenkit/scan/releases/download/v0.1.1/hardenkit_0.1.1_linux_arm64.tar.gz"
      sha256 "d943092576cff31b6df13c35eb54dd00695a9d2b93f0da1e939899a27fa1773a"
    end
    on_intel do
      url "https://github.com/hardenkit/scan/releases/download/v0.1.1/hardenkit_0.1.1_linux_amd64.tar.gz"
      sha256 "a148badd73f74bb67465f889748e13f48b6c46ffb82b0e7bd31b4e399fae33d9"
    end
  end

  def install
    bin.install "hardenkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hardenkit version")
  end
end
