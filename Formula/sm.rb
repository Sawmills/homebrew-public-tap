class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.16.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.16.1/sm_v0.16.1_Darwin_arm64.tar.gz"
      sha256 "1fb44974e75be71dea76068efc7d38afa4e3a3461b8c41b96a80841fd7e951cf"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.16.1/sm_v0.16.1_Darwin_x86_64.tar.gz"
      sha256 "80bc12a1c71bbf340c13a36bf93a223f6de87a76a91496c2fb591568744d8410"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.16.1/sm_v0.16.1_Linux_x86_64.tar.gz"
      sha256 "3b093fb4e0317159d74ab476311a975e94d8aa5626d24b88e38a33272b4c0665"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
