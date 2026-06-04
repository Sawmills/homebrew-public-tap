class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.21.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.21.1/sm_v0.21.1_Darwin_arm64.tar.gz"
      sha256 "ba91c4bbbd2872ca8cd3407b3cdc5133566a08289593590743151285777033ee"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.21.1/sm_v0.21.1_Darwin_x86_64.tar.gz"
      sha256 "ea0b6081746014fd8f9888a66bfd37d7f8ab58f3570a2f7b1dc702ec9569bc01"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.21.1/sm_v0.21.1_Linux_x86_64.tar.gz"
      sha256 "3ea43867016a58e02439debba2fb78963d4d0c72933362bfbdb6eb743352260b"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
