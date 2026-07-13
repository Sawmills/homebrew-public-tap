class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.22.7"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.7/sm_v0.22.7_Darwin_arm64.tar.gz"
      sha256 "52400e01e88c81141f4ee5ed1ef38a41c0b84275138686ec3bed9a436450e2ad"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.7/sm_v0.22.7_Darwin_x86_64.tar.gz"
      sha256 "5420278783a385282340b04bfc503392bc6baccc264b328ff7d294b54df33978"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.7/sm_v0.22.7_Linux_x86_64.tar.gz"
      sha256 "9aae98bc965e77afc9805de767bc88081eaf333916ba29a51dd0b5e07f1957ad"
    end
  end

  def install
    bin.install "sm"
    pkgshare.install "skills"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
    assert_path_exists pkgshare/"skills/customer-knowledge-curation.md"
  end
end
