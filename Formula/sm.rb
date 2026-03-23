class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.4.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.4.1/sm_v0.4.1_Darwin_arm64.tar.gz"
      sha256 "f8cb1e043897f2e8a1bb720d03846cee849486d3f1485e6c5aa9216e8291808b"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.4.1/sm_v0.4.1_Darwin_x86_64.tar.gz"
      sha256 "8d2500718e8f3f191ee15a7db19328786a6f34ba4c739dcb904c64740119ef22"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.4.1/sm_v0.4.1_Linux_x86_64.tar.gz"
      sha256 "ec3e95357dbdf615011479d2a6ec7de0fc4f2a26125ce7ab65a92db4388b972f"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
