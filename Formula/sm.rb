class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.18.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.1/sm_v0.18.1_Darwin_arm64.tar.gz"
      sha256 "a8424ff832dc7a34ff72fe18846ea67c5c23c72693b6ed6610178a913de1c32d"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.1/sm_v0.18.1_Darwin_x86_64.tar.gz"
      sha256 "95283661ee8232b2a0ce112f469c1a317e52bc76f65e993391645d688018a9f3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.1/sm_v0.18.1_Linux_x86_64.tar.gz"
      sha256 "072efc733fe9b4c2dba56ceb88aa07ed50b15ed4a6058ebda7e226128a8b4dea"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
