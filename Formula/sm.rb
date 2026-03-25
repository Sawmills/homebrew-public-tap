class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.7"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.7/sm_v0.5.7_Darwin_arm64.tar.gz"
      sha256 "514f73e5b4e35e75a64aa692087d51e366661a25c72e9ba993f9473f7f381ac1"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.7/sm_v0.5.7_Darwin_x86_64.tar.gz"
      sha256 "4362c2baa03a402777f1cee90d21cec0186b83d93345f83d519961fd29671ca6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.7/sm_v0.5.7_Linux_x86_64.tar.gz"
      sha256 "a7ca9442c4befafa5441ca5b6e27e852d21136a2800d0257f3f6757c57f72c31"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
