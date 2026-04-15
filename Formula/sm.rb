class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.6.5"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.5/sm_v0.6.5_Darwin_arm64.tar.gz"
      sha256 "d95e78c52ab0e9092aad44762a17e43fe59111ad43ad1f77a2ae08031be466cb"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.5/sm_v0.6.5_Darwin_x86_64.tar.gz"
      sha256 "ded317cff2f1a84db00c2db81e8bd0e21a59bed845aa8247abcddcbb7f3da5e9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.5/sm_v0.6.5_Linux_x86_64.tar.gz"
      sha256 "c322f08918bb972267c3f6972a7c306079ee23917eb8bf669b3cbb6dae2e0b0a"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
