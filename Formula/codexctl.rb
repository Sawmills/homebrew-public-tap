class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.10/codexctl_v0.1.10_Darwin_arm64.tar.gz"
      sha256 "391f693421dd1bfd8f135f934f5279f1127a68fd9ad0f7c2d2e582795ad0b507"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.10/codexctl_v0.1.10_Darwin_x86_64.tar.gz"
      sha256 "59af9a98eb543c22242921fd89e161edf1d3637ecf33934430cba7fb1f8f03be"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.10/codexctl_v0.1.10_Linux_x86_64.tar.gz"
      sha256 "de6b3e28d955f0dacbfbf4e1f44c293b2b51e2baa2b493dffa730bf1503058af"
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
