class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.22.10"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.10/sm_v0.22.10_Darwin_arm64.tar.gz"
      sha256 "7a16defcc4ab7c98fe3c7c740b98a6b151557f93eeb6cf692a870cbc1ab888cf"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.10/sm_v0.22.10_Darwin_x86_64.tar.gz"
      sha256 "626a2335ec80e3fae2eb76a9a0b5988b7d3e8b79b596f7420391eeee1eb434c8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.10/sm_v0.22.10_Linux_x86_64.tar.gz"
      sha256 "05127689ffa013a7de84c6d29864a70929f9ada54351d14c3fa087fe7d1b8f76"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
