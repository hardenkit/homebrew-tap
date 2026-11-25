#!/bin/sh
# Writes Formula/hardenkit.rb for a release of hardenkit/scan.
#
#   ./update.sh          # the latest release
#   ./update.sh 0.1.0    # a given version
set -eu

repo="hardenkit/scan"
version="${1:-}"
if [ -z "$version" ]; then
  version=$(curl -sSfL -o /dev/null -w '%{url_effective}' "https://github.com/$repo/releases/latest" | sed 's|.*/tag/||')
fi
version="${version#v}"
base="https://github.com/$repo/releases/download/v$version"

sums=$(curl -sSfL "$base/checksums.txt")
sum() {
  s=$(printf '%s\n' "$sums" | grep " hardenkit_${version}_$1.tar.gz\$" | cut -d' ' -f1)
  [ -n "$s" ] || { echo "no checksum for $1 in v$version" >&2; exit 1; }
  printf '%s' "$s"
}

cat > Formula/hardenkit.rb <<RUBY
# Written by update.sh from the hardenkit/scan release. Do not edit by hand.
class Hardenkit < Formula
  desc "Vulnerability scanner that ranks findings by real attacks"
  homepage "https://hardenkit.com"
  version "$version"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "$base/hardenkit_${version}_darwin_arm64.tar.gz"
      sha256 "$(sum darwin_arm64)"
    end
    on_intel do
      url "$base/hardenkit_${version}_darwin_amd64.tar.gz"
      sha256 "$(sum darwin_amd64)"
    end
  end

  on_linux do
    on_arm do
      url "$base/hardenkit_${version}_linux_arm64.tar.gz"
      sha256 "$(sum linux_arm64)"
    end
    on_intel do
      url "$base/hardenkit_${version}_linux_amd64.tar.gz"
      sha256 "$(sum linux_amd64)"
    end
  end

  def install
    bin.install "hardenkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hardenkit version")
  end
end
RUBY
echo "Formula/hardenkit.rb is at $version"
