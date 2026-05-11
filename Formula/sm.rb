class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.15.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.15.1/sm_v0.15.1_Darwin_arm64.tar.gz"
      sha256 "39d2c325c716474990d3109eb3a9c97df17bd4b32a79b79dee25ad452acda87b"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.15.1/sm_v0.15.1_Darwin_x86_64.tar.gz"
      sha256 "0068f63b13f6447fc9cadc5f1940b7f1b18b8706463bc8b05dbce0c11825480a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.15.1/sm_v0.15.1_Linux_x86_64.tar.gz"
      sha256 "1bf697779c69fb0ccd9497e2d0d7757f3a43b1df510a64cb677393792a1d3e85"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
