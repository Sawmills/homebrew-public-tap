class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.3.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.1/sm_v0.3.1_Darwin_arm64.tar.gz"
      sha256 "9ec54a67cc9db2d52257914f55d2734627b8ee7dad55e78db070157a517c5a6a"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.1/sm_v0.3.1_Darwin_x86_64.tar.gz"
      sha256 "a50b14d9f283e1277322985c2430a2aa526a37dc3c271235b6d4f99c9e709d8f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.1/sm_v0.3.1_Linux_x86_64.tar.gz"
      sha256 "4396ce84fbfd6aba3e20604be6f1b1a541b33d67e7fdbbb9554121def94b070b"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
