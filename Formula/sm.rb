class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.11.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.11.0/sm_v0.11.0_Darwin_arm64.tar.gz"
      sha256 "c600f869fe4b1cae1c763c19609a6e3e8ef3dbb4eea88071d69aa9e9eb439bb6"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.11.0/sm_v0.11.0_Darwin_x86_64.tar.gz"
      sha256 "8f1ce32e99cf8c9c02a33f9e27fa63741c2251861c10efeea266a911ba83e2ca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.11.0/sm_v0.11.0_Linux_x86_64.tar.gz"
      sha256 "c4d556275b6285ee8fd54428a7006e2d9a14702178ec221c2e0d922089b33a95"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
