class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.17.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.17.0/sm_v0.17.0_Darwin_arm64.tar.gz"
      sha256 "17a45a3ac367b61fe98d61f0a230ed58e2de6b404d22abc2df4895d14c811648"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.17.0/sm_v0.17.0_Darwin_x86_64.tar.gz"
      sha256 "f5da001196be0575fb1c3b9acb81bc938bf2ad71975d23284b60c180fb1ed0cc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.17.0/sm_v0.17.0_Linux_x86_64.tar.gz"
      sha256 "2a9f2815d42270d4d742c7a20f8e7461831f0d8971f3f49fecc63cc4df87bf62"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
