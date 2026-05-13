class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.16.4"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.16.4/sm_v0.16.4_Darwin_arm64.tar.gz"
      sha256 "1ccfe3155466ba193595c6af1453ddbd3929ac235945f834bca294d77614f4dc"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.16.4/sm_v0.16.4_Darwin_x86_64.tar.gz"
      sha256 "385e2a1aa4fab7811034aa1c6d1b21b5614deba66b325d7cff293aaad241b4e5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.16.4/sm_v0.16.4_Linux_x86_64.tar.gz"
      sha256 "7e1192c6e2912262c4c965f2e6b05cf4b6fda07b42aa6e502ba55d9f6c354ff2"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
