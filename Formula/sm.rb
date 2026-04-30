class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.12.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.12.0/sm_v0.12.0_Darwin_arm64.tar.gz"
      sha256 "ef97f51850e883adf3cc094f310d9e782e36c3a8dbc3bb36b164fe87e4647ff5"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.12.0/sm_v0.12.0_Darwin_x86_64.tar.gz"
      sha256 "bbe3f2c50d20e5c9559db2deca32476173bb402deaf0ebefe6e2963fbe48b7c2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.12.0/sm_v0.12.0_Linux_x86_64.tar.gz"
      sha256 "5fad7a84113e8bc31ca86493cdd0c65cb89167b92c9ee10c0fbd19393d0179af"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
