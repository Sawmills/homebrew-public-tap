class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  version "0.22.12"
  # Homebrew formula distributes Sawmills binaries under proprietary terms.
  # Source repository metadata in Cargo.toml remains MIT.
  license :cannot_represent

  # Legacy naming: this bucket is the canonical public endpoint for
  # externally downloadable sm artifacts.
  on_macos do
    if Hardware::CPU.arm?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.12/sm_v0.22.12_Darwin_arm64.tar.gz"
      sha256 "f47c54123767248387becd8e1c7368788cc222a4268c2479f337cc243fb5e2f6"
    else
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.12/sm_v0.22.12_Darwin_x86_64.tar.gz"
      sha256 "20a225c1356264fbe27782ef01eec00fc705c467da9078b9d23b680076319f25"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://sawmills-plat-ue1-staging-public-artifacts.s3.us-east-1.amazonaws.com/releases/v0.22.12/sm_v0.22.12_Linux_x86_64.tar.gz"
      sha256 "78d0f24b0b33d21e769312f50114813b60140c41770d71bc8ca4bed2423318d4"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
