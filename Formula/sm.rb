class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.8.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.8.0/sm_v0.8.0_Darwin_arm64.tar.gz"
      sha256 "9bc873ce76ab23b8b0205eb26801ad7db66638119aed6099c23a53cd1cee108e"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.8.0/sm_v0.8.0_Darwin_x86_64.tar.gz"
      sha256 "e962dcf44eb91495f1d6b83c1f874c7cec262941ba2e9196e2c861526dca470f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.8.0/sm_v0.8.0_Linux_x86_64.tar.gz"
      sha256 "f0b6d95b2209b8b0218655675fa0c6c6702e6f358fe068010c673036ff0b2417"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
