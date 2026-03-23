class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.3.2"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.2/sm_v0.3.2_Darwin_arm64.tar.gz"
      sha256 "cee0c6247db31e3214c3fad6bbd180e523e27cd2f0db77ed7fc176bd7e3c93b8"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.2/sm_v0.3.2_Darwin_x86_64.tar.gz"
      sha256 "98b30d61a4dfe9389d431748335e6484d162cd840c02bb702329fb5443136f03"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.3.2/sm_v0.3.2_Linux_x86_64.tar.gz"
      sha256 "e52051cbe1608d276cce96165caa996917bb1ef64d715767b5a29f07e1ea5c31"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
