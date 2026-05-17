class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.18.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.0/sm_v0.18.0_Darwin_arm64.tar.gz"
      sha256 "982efacd0c3c99ba7ab3d571d272774a5944ebf84dd4fc42b6450e97aaa7f4f8"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.0/sm_v0.18.0_Darwin_x86_64.tar.gz"
      sha256 "15ca1e43ed6e9e72716a552ecefd049dba7461d7d07c6b535fa38ffe3ed7cad1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.0/sm_v0.18.0_Linux_x86_64.tar.gz"
      sha256 "90f60f4f85b4f7a81c3a3e558c60e8167a44664393a3d47375ae97e4605bad96"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
