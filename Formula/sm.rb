class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.18.3"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.3/sm_v0.18.3_Darwin_arm64.tar.gz"
      sha256 "3eceb6a5cc45a15468c800db78b24cae7afac48968b1519d8efe0de7f4f42518"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.3/sm_v0.18.3_Darwin_x86_64.tar.gz"
      sha256 "2ff4ed924a1d54133d8f90db32bb1ff313aa8e23e8e9836ff7777ca5fb1c853d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.18.3/sm_v0.18.3_Linux_x86_64.tar.gz"
      sha256 "319a65dfc1fd5edf795684cb843198c326be8a48e874c7f87084f32146522fda"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
