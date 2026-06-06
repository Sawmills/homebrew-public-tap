class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.11/codexctl_v0.1.11_Darwin_arm64.tar.gz"
      sha256 "0da273ce4ad2dda1f1722fd9b2584b48cd781751e0fa699efe118b0d24373f7b"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.11/codexctl_v0.1.11_Darwin_x86_64.tar.gz"
      sha256 "161dd5c7faee4ad65da128af1b94ce141a52d06d5573c41523e73f6059d947c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.11/codexctl_v0.1.11_Linux_x86_64.tar.gz"
      sha256 "0ceb5f52cb7879baef14ebab03ba2a3e57f6b38eb01a1d07fbdee06855af688a"
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
