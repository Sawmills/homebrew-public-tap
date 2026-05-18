class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.18.2"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.2/sm_v0.18.2_Darwin_arm64.tar.gz"
      sha256 "1b7b1e5c46566a5e04724b2b1e18b12bbc8abc68d1f2744fce2d7e27b1f3dc73"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.2/sm_v0.18.2_Darwin_x86_64.tar.gz"
      sha256 "21ce4b491d2df7d0002c1f1615a213bdc02d3dd86d4ada468b3e38d5e4171467"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.2/sm_v0.18.2_Linux_x86_64.tar.gz"
      sha256 "70004271114e3627c6a2a651abd7ac75f00b25f33703048771fff3b7c04ec6f9"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
