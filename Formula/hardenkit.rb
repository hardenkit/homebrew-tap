# Written by update.sh from the hardenkit/scan release. Do not edit by hand.
class Hardenkit < Formula
  desc "Vulnerability scanner that ranks findings by real attacks"
  homepage "https://hardenkit.com"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hardenkit/scan/releases/download/v0.1.0/hardenkit_0.1.0_darwin_arm64.tar.gz"
      sha256 "95b97c41ed1150fd8f58f65eb98ea27ca43c7fc75b70078b85813b0ea2542f9d"
    end
    on_intel do
      url "https://github.com/hardenkit/scan/releases/download/v0.1.0/hardenkit_0.1.0_darwin_amd64.tar.gz"
      sha256 "7ac35f67731ef4a44c40d67d0113501bbe1b72c3233bfe0d9844fe939ae52442"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hardenkit/scan/releases/download/v0.1.0/hardenkit_0.1.0_linux_arm64.tar.gz"
      sha256 "2ceef6892996ce26e68eea2c5e60321d7404c20f1eabf909542d4495fbc0af05"
    end
    on_intel do
      url "https://github.com/hardenkit/scan/releases/download/v0.1.0/hardenkit_0.1.0_linux_amd64.tar.gz"
      sha256 "b0cb2d41a123e84c922f31ccbc4232aa5a8c1e3c91d6556aa608662b253eba12"
    end
  end

  def install
    bin.install "hardenkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hardenkit version")
  end
end
