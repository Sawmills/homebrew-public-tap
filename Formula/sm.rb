class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.20.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.20.1/sm_v0.20.1_Darwin_arm64.tar.gz"
      sha256 "5931c7360f0f4742d0c1fdddc7c729b5cea59c100bbf7e9a118de73440d06204"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.20.1/sm_v0.20.1_Darwin_x86_64.tar.gz"
      sha256 "263ebbe1bd40f8c2b560789625c7d7daaccadf07446fb99676dab4d4752556c5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.20.1/sm_v0.20.1_Linux_x86_64.tar.gz"
      sha256 "59c7173f2e2832b461f192751b13d7adcf9af09e26730e3c34f1307cae4ec0b5"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
