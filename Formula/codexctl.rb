class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.6/codexctl_v0.1.6_Darwin_arm64.tar.gz"
      sha256 "17548a628e19a3c586748e1b352c0af2a02319f8077447936a5966d55c98bfcd"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.6/codexctl_v0.1.6_Darwin_x86_64.tar.gz"
      sha256 "70f73121c3a441229edb96bbafe1ff566089a1f532b245cb387687ae2ff3e8ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.6/codexctl_v0.1.6_Linux_x86_64.tar.gz"
      sha256 "e2cefdcbed26e4c731f6a0856a341cf4fb3499596870cf1c7b122ded58b0d376"
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
