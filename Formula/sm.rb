class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.14.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.14.0/sm_v0.14.0_Darwin_arm64.tar.gz"
      sha256 "6eb03e9e1220c90b51c3e9a25e07696d65b5e3a6ddc15e2d18fa04719ae19d2e"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.14.0/sm_v0.14.0_Darwin_x86_64.tar.gz"
      sha256 "628b7cc977859c0f2e894d41ff40ff41d99019676cdfca01f3edab11ce13110e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.14.0/sm_v0.14.0_Linux_x86_64.tar.gz"
      sha256 "83bef74b940726acf85e3810ece88070185b93aa1f26c95e41d31fc49d9a21bc"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
