class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.4.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.4.0/sm_v0.4.0_Darwin_arm64.tar.gz"
      sha256 "855d856712a918c8c3c8e99d0376cbee84655f9070e33a87999c3d4f38a508dd"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.4.0/sm_v0.4.0_Darwin_x86_64.tar.gz"
      sha256 "d5469a103c1948685ac4641fa248690b868644820d57dd081bcb7a5a5a47c655"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.4.0/sm_v0.4.0_Linux_x86_64.tar.gz"
      sha256 "338fd29932f4ff4df1559707bd0da26151e6156f53e3f4c24a4e974e6ffad7b5"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
