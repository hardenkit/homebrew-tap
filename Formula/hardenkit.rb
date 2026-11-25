# Written by update.sh from the hardenkit/scan release. Do not edit by hand.
class Hardenkit < Formula
  desc "Vulnerability scanner that ranks findings by real attacks"
  homepage "https://hardenkit.com"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hardenkit/scan/releases/download/v0.2.0/hardenkit_0.2.0_darwin_arm64.tar.gz"
      sha256 "17bb2cbf7067967dce45a731794c3fdacbf980e83f2fd8382aaea437d91bc46e"
    end
    on_intel do
      url "https://github.com/hardenkit/scan/releases/download/v0.2.0/hardenkit_0.2.0_darwin_amd64.tar.gz"
      sha256 "ae8d34319c41ed4dd760f2790b04dfa8b5e26fdce9b7f71565d70ea46817babd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hardenkit/scan/releases/download/v0.2.0/hardenkit_0.2.0_linux_arm64.tar.gz"
      sha256 "6054b993c56b514b54adad9f39c270c1fe5f952850309fdee9acebe513b100e1"
    end
    on_intel do
      url "https://github.com/hardenkit/scan/releases/download/v0.2.0/hardenkit_0.2.0_linux_amd64.tar.gz"
      sha256 "bf758f8515d2762934019e4d7eb1087b4a44e14b31e89bab598a24a9fcc1d7b9"
    end
  end

  def install
    bin.install "hardenkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hardenkit version")
  end
end
