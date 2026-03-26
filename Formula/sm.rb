class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.5.9"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.9/sm_v0.5.9_Darwin_arm64.tar.gz"
      sha256 "58edfb4881ad5b9f330ecaf6e172bfe0254179457a9a1d97cd749f4e017b3df3"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.9/sm_v0.5.9_Darwin_x86_64.tar.gz"
      sha256 "9c41a7ece0e333cc68f8cdb6b3327f1392fd7f0324b655669e0754e5ee47a209"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.5.9/sm_v0.5.9_Linux_x86_64.tar.gz"
      sha256 "50570cb80e03a6c4782a07ad0abc043e9246f2ceb88d3087a4b4dfbf5e380294"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
