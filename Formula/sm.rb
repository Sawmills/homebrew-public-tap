class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.7"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.7/sm_v0.2.7_Darwin_arm64.tar.gz"
      sha256 "6ac059214f19d088b30786ae0c0ce48b68d3ea1e9fab77d08242b5002c093962"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.7/sm_v0.2.7_Darwin_x86_64.tar.gz"
      sha256 "eaaff63500e422dd726ee056a9dad9cb5dc292afcd8e56c7af04902273ea844d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.7/sm_v0.2.7_Linux_x86_64.tar.gz"
      sha256 "aea7d37d0f2fd7ed5aeceef813bc8e837c9a18f58a4c8e0ed79f3302a4dd9265"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
