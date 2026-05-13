class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.16.3"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.16.3/sm_v0.16.3_Darwin_arm64.tar.gz"
      sha256 "1b38a12287193a28a15f6a2c78c6f785249abdf0da84e03d14793e883566e8b3"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.16.3/sm_v0.16.3_Darwin_x86_64.tar.gz"
      sha256 "d98386bd25f1b9e466fdc261e31b14532751da02671369b974c10a16c37ed0f3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.16.3/sm_v0.16.3_Linux_x86_64.tar.gz"
      sha256 "9e8ba759baa54d2a4a00a3a7c8c5265ee7383af4781d9b0524e5f07c664fef69"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
