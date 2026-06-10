class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.22.4"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.4/sm_v0.22.4_Darwin_arm64.tar.gz"
      sha256 "d8c693fa0257bc6c344b96aabf07fc055d468f4e8c020b63ab7d59ee7584f506"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.4/sm_v0.22.4_Darwin_x86_64.tar.gz"
      sha256 "7a2c4278f72167fcc2ce457e6b5c5fb5b8081275d28b1eeb5673fd484bb8dd8d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.4/sm_v0.22.4_Linux_x86_64.tar.gz"
      sha256 "ec69390e467907253211684dfcc18b953ab07ae971a0e739266658dec3f56010"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
