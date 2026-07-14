class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.22.9"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.9/sm_v0.22.9_Darwin_arm64.tar.gz"
      sha256 "4ea2cbed40986ae8ff241f1cdbb1edad6f1d3880bec74d6502f56b12974001cf"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.9/sm_v0.22.9_Darwin_x86_64.tar.gz"
      sha256 "edeb053d089b173e7176a14279c4bed4ecc797132da7616df421e4d0da4b812d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.9/sm_v0.22.9_Linux_x86_64.tar.gz"
      sha256 "a5a44a0d37dde5d1f7030b1f4cf2335c74f0f7d09fde43cec3cb32e56a17ee9f"
    end
  end

  def install
    bin.install "sm"
    pkgshare.install "skills"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
    assert_path_exists pkgshare/"skills/customer-knowledge-curation.md"
  end
end
