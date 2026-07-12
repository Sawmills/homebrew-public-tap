class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.22.6"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.6/sm_v0.22.6_Darwin_arm64.tar.gz"
      sha256 "e86fa75a6e9878f16a57daa3770b685e0b4efe9c61ed47a1560cbefcf4d43229"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.6/sm_v0.22.6_Darwin_x86_64.tar.gz"
      sha256 "a9c0a20c25fc93d4e8c8339e613c66412a2052755c619c1226d03c75f6b6c131"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.6/sm_v0.22.6_Linux_x86_64.tar.gz"
      sha256 "49d2cb3c3db2e59f56f079c5bf37b0c083aab5c2f11d41abfd8c6cb90e49634a"
    end
  end

  def install
    bin.install "sm"
    pkgshare.install "skills"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
    assert_path_exists pkgshare/"skills/conditions-authoring.md"
  end
end
