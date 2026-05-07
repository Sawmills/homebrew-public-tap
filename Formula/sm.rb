class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.14.1"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.14.1/sm_v0.14.1_Darwin_arm64.tar.gz"
      sha256 "739517ba2fb7b4ff927a400ef5fa84437aee23dd4299e143212012c6023951fd"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.14.1/sm_v0.14.1_Darwin_x86_64.tar.gz"
      sha256 "268b101b0e5f238a564388736a415978c0ec409547049397ca9b09b83bcc11e3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.14.1/sm_v0.14.1_Linux_x86_64.tar.gz"
      sha256 "69d7be4310ac5d46e54aca2ed1b56abc6bf86b938db00611fbf554d04b2f200c"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
