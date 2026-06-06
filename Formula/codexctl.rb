class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.9/codexctl_v0.1.9_Darwin_arm64.tar.gz"
      sha256 "2bd77382057db24e006474638002b199bee8159438e4b292d80d09566b568c59"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.9/codexctl_v0.1.9_Darwin_x86_64.tar.gz"
      sha256 "2aa16a281ea47e65548d303f96ad54951693c1becfe0e05ff30ab33ecef2828c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.9/codexctl_v0.1.9_Linux_x86_64.tar.gz"
      sha256 "1b8ca975f1276005f9d3e6a04a663e427b8e4b5d55e75e26424a906d104fa305"
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
