class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.2.10"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.10/sm_v0.2.10_Darwin_arm64.tar.gz"
      sha256 "3f708c5126b09e76d5110461d613fa88caef603e540b3bd00765b242b5deece8"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.10/sm_v0.2.10_Darwin_x86_64.tar.gz"
      sha256 "eabc44a4ff990d863220e9d91cc97f330b4a1e792256e3761789e6750898b771"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.2.10/sm_v0.2.10_Linux_x86_64.tar.gz"
      sha256 "8716f10d42a9c931e9d9754e23518d442172f0ec8d9305dedd903733ae951108"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
