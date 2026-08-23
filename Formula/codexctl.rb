class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.23/codexctl_v0.1.23_Darwin_arm64.tar.gz"
      sha256 "1f6b6c2b5a3e70b3b39f28803baa31becb1d3d6618d77ac2c04e92d4d8429c87"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.23/codexctl_v0.1.23_Darwin_x86_64.tar.gz"
      sha256 "2670baeb68b0abee45cdaecb5614119fa2d53d9a6f54d3077395b014524f66fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.23/codexctl_v0.1.23_Linux_x86_64.tar.gz"
      sha256 "1ad5073b5571f9608b41f702f9b72013cfe140f503ea58a7700602d7961f5132"
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
