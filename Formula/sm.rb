class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.22.3"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.3/sm_v0.22.3_Darwin_arm64.tar.gz"
      sha256 "9bfaeaf013d971dee98833ca4da254bfe83c2aead2f0b850eeb1eca0a94ed785"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.3/sm_v0.22.3_Darwin_x86_64.tar.gz"
      sha256 "39a2b046cb48c7c1727cc1e35fc0fdd21d12edfae56c3e8492fd44533479ad95"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.3/sm_v0.22.3_Linux_x86_64.tar.gz"
      sha256 "625c472d54f164cfeb2393d88a38f75bac8f887d37b70cbe840bd1c3581982ae"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
