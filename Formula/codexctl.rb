class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.7/codexctl_v0.1.7_Darwin_arm64.tar.gz"
      sha256 "db9ab791a2a6ed0cf62d360c8eb3b193c2b8a70c86f945c341b75628b4bb7036"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.7/codexctl_v0.1.7_Darwin_x86_64.tar.gz"
      sha256 "4b7f604afb0285a8fb492ffd08ff2ee83ce68fc991ef0d5559d2ac4dfee5bfb9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.7/codexctl_v0.1.7_Linux_x86_64.tar.gz"
      sha256 "ee7b1fb0379d78b3a1a4fb930895dcfb9c894fd82d586b7f63cd50cfa8402ff0"
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
