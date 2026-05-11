class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.15.2"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.15.2/sm_v0.15.2_Darwin_arm64.tar.gz"
      sha256 "a4a62b887a0fee66325dfe9a892daac373f54d2cffbc2a4b91f36dd222d3133a"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.15.2/sm_v0.15.2_Darwin_x86_64.tar.gz"
      sha256 "bfcaec7114918677c9ce4d25c1439be1678497de0fe8fd0912ae58378a01a0fa"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.15.2/sm_v0.15.2_Linux_x86_64.tar.gz"
      sha256 "a4f9fa6181687a1369c6c41f4a595357f7de2c84b7086e2c260e2d774482af96"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
