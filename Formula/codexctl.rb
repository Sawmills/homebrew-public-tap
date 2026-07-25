class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.16"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.16/codexctl_v0.1.16_Darwin_arm64.tar.gz"
      sha256 "aa0018fde1dba8ce0f9ba04a8a32f6ae1d48877d58353876450f608d0315e628"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.16/codexctl_v0.1.16_Darwin_x86_64.tar.gz"
      sha256 "e6105a02f9be4d1d111f08097f45db9e61c9407116c4285ff775cb9e660f9fad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.16/codexctl_v0.1.16_Linux_x86_64.tar.gz"
      sha256 "162c50d9f43df2276dd939011cfec4852f909987f8c13ed4b8ddf26f2a855394"
    end
  end

  def install
    bin.install "codexctl"
    generate_completions_from_executable(bin/"codexctl", "completions")
  end

  test do
    help = shell_output("#{bin}/codexctl --help")
    assert_match "Usage:", help
    assert_match "codexctl", help
    assert_path_exists bash_completion/"codexctl"
    assert_path_exists zsh_completion/"_codexctl"
    assert_path_exists fish_completion/"codexctl.fish"
  end
end
