class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.14/codexctl_v0.1.14_Darwin_arm64.tar.gz"
      sha256 "a06d1414afc87af7745311e0d875bfb3d0ff0ef6843fa4cd0f1610fef2e58918"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.14/codexctl_v0.1.14_Darwin_x86_64.tar.gz"
      sha256 "8faa91bbdea42b43b99c9a90ff3051af4769c1715a2fd12aefe3962ece2bd26e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.14/codexctl_v0.1.14_Linux_x86_64.tar.gz"
      sha256 "c7b31480103ebf5e80f8be7ba8cc34b92c397c0e332a3d3bc647dd7cab0ea7a4"
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
