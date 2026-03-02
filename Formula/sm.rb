class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.5"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.5/sm_v0.2.5_Darwin_arm64.tar.gz"
      sha256 "9d4a79d1533221230acfc3a834a2e3726b805994e87a2a0d3a20d52d28c57929"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.5/sm_v0.2.5_Darwin_x86_64.tar.gz"
      sha256 "6289ec171c7bbadb3a07e18b6ac5ad9391c396aebc7c24c38a9ca9c3322c7ef1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.5/sm_v0.2.5_Linux_x86_64.tar.gz"
      sha256 "1dbfe21ad17404e9dae9e0a5f9097aded068826082e6fb3a9766647d0dc00297"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
