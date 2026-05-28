class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.20.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.20.0/sm_v0.20.0_Darwin_arm64.tar.gz"
      sha256 "7b0f3c8ded866e5e8d4119a690046783d05fe56db0d9571ebd84bd86060fad98"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.20.0/sm_v0.20.0_Darwin_x86_64.tar.gz"
      sha256 "54ddf16282b98ab9c239ab6590d4c6005006bda6bf5ec3426b20d207ef334350"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.20.0/sm_v0.20.0_Linux_x86_64.tar.gz"
      sha256 "e5d7dbe6e24964bf4d7b66faf5a80571a7b799cb8276163d0ddc6b2415ea8604"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
