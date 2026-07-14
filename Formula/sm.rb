class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.22.8"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.8/sm_v0.22.8_Darwin_arm64.tar.gz"
      sha256 "d3ad053cc96af144e9bc5e1e1ddf45a8054496a129dd5630c05977adbedfa447"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.8/sm_v0.22.8_Darwin_x86_64.tar.gz"
      sha256 "a3f7139e8b69bebd728b203d67357b665dbf49b202c2a82814e1d75168f0b16a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.8/sm_v0.22.8_Linux_x86_64.tar.gz"
      sha256 "ec7062f06b4793a8f20e4fcbcf59968e261190f42da1362fc70cfb85a6199530"
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
