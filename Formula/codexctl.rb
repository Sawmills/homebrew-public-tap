class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.22/codexctl_v0.1.22_Darwin_arm64.tar.gz"
      sha256 "41cb3cacdc94342098db662199de84475f1f81e7e6f30a686bd78f8393b8ef79"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.22/codexctl_v0.1.22_Darwin_x86_64.tar.gz"
      sha256 "3ce6862d93a70019d04ede53350f66abb43b7bf5bc42838ef96f6499d2e7f021"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.22/codexctl_v0.1.22_Linux_x86_64.tar.gz"
      sha256 "ab7ca7e57bb03f6a14c11b39a06cbe37aec3bf93108e93611332cdaedb713ac8"
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
