class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.22.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.0/sm_v0.22.0_Darwin_arm64.tar.gz"
      sha256 "2fe1887dcae91b5e0c2fb843da974ff7e4616006a407de95e2c19fbafb07eab1"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.0/sm_v0.22.0_Darwin_x86_64.tar.gz"
      sha256 "cff711b24316c2a654b946432b32f607cfda824850a4dabf25b4bb77e2c895a0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.0/sm_v0.22.0_Linux_x86_64.tar.gz"
      sha256 "069f8f503812e024536f6bac8a9b3f0317ab5e7793dd44508b185820d407dd65"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
