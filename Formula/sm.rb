class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.15.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.15.0/sm_v0.15.0_Darwin_arm64.tar.gz"
      sha256 "bb77b121d59f5ac6eb0e4506cc6fa8f9f24218a121b9cacd12d723b34516c575"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.15.0/sm_v0.15.0_Darwin_x86_64.tar.gz"
      sha256 "265124b0104a4142e5881162742ef8473243f4950809fafd121c7c5e08c937e6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.15.0/sm_v0.15.0_Linux_x86_64.tar.gz"
      sha256 "40dfde6c599d05ded0854c7c99cb0dc55052c3e1058bc1510a9426b199911fbc"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
