class Sm < Formula
  desc "Sawmills.ai CLI - telemetry cost optimization"
  homepage "https://github.com/Sawmills/sawmills-cli"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/sawmills-cli/releases/download/v0.2.0/sm_v0.2.0_Darwin_arm64.tar.gz"
      sha256 "3602b0262371518865f5fabb8ddfff43bcdec4519e57ae6e856704fcd8d37b9c"
    else
      url "https://github.com/Sawmills/sawmills-cli/releases/download/v0.2.0/sm_v0.2.0_Darwin_x86_64.tar.gz"
      sha256 "d56d49163360fc40c1d0e27a9dc2846c29a19b9fe7a146a12db88e84c14cbd3d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Sawmills/sawmills-cli/releases/download/v0.2.0/sm_v0.2.0_Linux_x86_64.tar.gz"
      sha256 "7864c89abe5de46db8c020912940cdb0fe6b1d04973d3a71c8205d0f3377de7a"
    end
  end

  def install
    bin.install "sm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
