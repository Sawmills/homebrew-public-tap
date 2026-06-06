class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.8/codexctl_v0.1.8_Darwin_arm64.tar.gz"
      sha256 "d9c556c3296732b4137ba1e41f663413220df96a1b2deb9e8c67305d15d88e52"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.8/codexctl_v0.1.8_Darwin_x86_64.tar.gz"
      sha256 "712772d8567f5f660ecddcb74aaffb4b3ef9a51b003c0fb33b7f71cd1a8caa31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.8/codexctl_v0.1.8_Linux_x86_64.tar.gz"
      sha256 "09bbae52be2e1ea348ddc754ae7d8c3aad6ede59698a5fa775a31747a3a1098f"
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
