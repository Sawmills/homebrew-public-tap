class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.19/codexctl_v0.1.19_Darwin_arm64.tar.gz"
      sha256 "76fbc2d8937ab6d16ef2ce5b7d5bed5e61b3cb0ee221cc537886c12c4650d9aa"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.19/codexctl_v0.1.19_Darwin_x86_64.tar.gz"
      sha256 "88db5a6564e27cb95b44ff3f5f6b4633b4d74830cbf73c23ff46cb3cb76fd0bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.19/codexctl_v0.1.19_Linux_x86_64.tar.gz"
      sha256 "4d291d6939b743b5b85d531ba6324e6958f726f3d2e5fa7acff9452fdf353c38"
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
