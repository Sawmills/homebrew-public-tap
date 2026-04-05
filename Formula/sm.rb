class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.6.0"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.0/sm_v0.6.0_Darwin_arm64.tar.gz"
      sha256 "ca03ef6756991ce5bd903ec736cd4aa6c65ed5a0de373d810972b0bcc97ee5e6"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.0/sm_v0.6.0_Darwin_x86_64.tar.gz"
      sha256 "41b8e9096780513dfbfab3e46bb6d1e3b5871ee5a965b46c7c954fead91b5c38"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.6.0/sm_v0.6.0_Linux_x86_64.tar.gz"
      sha256 "2fcf39b1f7d24a985a9aab3da8c87044a683d86fa399afeb0393d831966bdf28"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
