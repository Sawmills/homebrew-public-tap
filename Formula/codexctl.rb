class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.18/codexctl_v0.1.18_Darwin_arm64.tar.gz"
      sha256 "bcd396e535c60da030daca414818777fc3682075f401a080c41e7f08b38a2c18"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.18/codexctl_v0.1.18_Darwin_x86_64.tar.gz"
      sha256 "e5a8fec5418a44ac0c09b5b04666836ce66cfceef258b6edab4112f78f57d957"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.18/codexctl_v0.1.18_Linux_x86_64.tar.gz"
      sha256 "fcda8a01df7df74d29709eed054017c29d3e566706b11f0ba84434d2b0ff682d"
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
