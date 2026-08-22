class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.21/codexctl_v0.1.21_Darwin_arm64.tar.gz"
      sha256 "842b863f4b7cc6359d15fd222799aeccffdc1163c54159b4e5a5776fc22d0694"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.21/codexctl_v0.1.21_Darwin_x86_64.tar.gz"
      sha256 "6d1ddb7046f86a68c565a236b912b4c352e42ad5666a85d1653ca488d3ee6f07"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.21/codexctl_v0.1.21_Linux_x86_64.tar.gz"
      sha256 "559817a402f6f80a6b62460db01f679961b1300147a9e982b8682f4400910c16"
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
