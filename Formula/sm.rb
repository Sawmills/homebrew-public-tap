class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.6.3"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.3/sm_v0.6.3_Darwin_arm64.tar.gz"
      sha256 "434031224fab0ac6c2de0c9760fcfc3fe488b2915c9290f9746b443b97379159"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.3/sm_v0.6.3_Darwin_x86_64.tar.gz"
      sha256 "797eff4610cd25af3fb593bf3a11534c3652617e0bc232da09eae2ff65cebb7d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.3/sm_v0.6.3_Linux_x86_64.tar.gz"
      sha256 "fb27566c7d276029c6f211a81ca46264a49eea2a6aa6024c1bfac8a53119180a"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
