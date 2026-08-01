class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.17/codexctl_v0.1.17_Darwin_arm64.tar.gz"
      sha256 "4845ca88cf0c1a0d8585970000242920a343177183cc8c9ba1f19a8a5443631d"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.17/codexctl_v0.1.17_Darwin_x86_64.tar.gz"
      sha256 "ee87cda754747f015da916c3f79cea82f97b6518e298928da52bd426bfb3fd89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.17/codexctl_v0.1.17_Linux_x86_64.tar.gz"
      sha256 "e0c44b3fdce2634614a6a2261d302b695a26f971df4289bf8ae8ffc50aa14c18"
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
