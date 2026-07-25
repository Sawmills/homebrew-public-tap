class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.15/codexctl_v0.1.15_Darwin_arm64.tar.gz"
      sha256 "508a86a6cd90456e99f2fbce159bc215eb60ac4a3edc6f99af105780ef9cba82"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.15/codexctl_v0.1.15_Darwin_x86_64.tar.gz"
      sha256 "0829f0a20fe685ca8d8adfe6500d0a82d7ed87dd6a0ecc320df3002236051f61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.15/codexctl_v0.1.15_Linux_x86_64.tar.gz"
      sha256 "b66b1e6472522d7099bc33df783a424b55d641e74e8962b1e3959739c6fa0b52"
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
