class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.21.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.21.0/sm_v0.21.0_Darwin_arm64.tar.gz"
      sha256 "337f5a60c5908d9ae54214e4e4acba7ad7788e6ae023c3671a474a15fba57248"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.21.0/sm_v0.21.0_Darwin_x86_64.tar.gz"
      sha256 "db2170f713f0e5b616e38b01f08d0ae672f884958520a2f005a73b3c7615eb4a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.21.0/sm_v0.21.0_Linux_x86_64.tar.gz"
      sha256 "c2ba753bfbbd7f5f7aae5f62d1e82a2e0393ba9ab4bc0d2412cb371388af70a4"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
