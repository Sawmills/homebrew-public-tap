class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.1/claudectl_v0.1.1_Darwin_arm64.tar.gz"
      sha256 "18f545c766a92b5e7e908bf12a35d21bb153b4ef10e4feffa661957575ba27f7"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.1/claudectl_v0.1.1_Darwin_x86_64.tar.gz"
      sha256 "2da31e4d812b56a2b0982ed512aeede55014e1be207fa15e98f75404b521e943"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.1/claudectl_v0.1.1_Linux_x86_64.tar.gz"
      sha256 "0ac026257f1dfe3dffa4b3ff500c9a78843b3b1e09829b90816fb8dd8a3137fa"
    end
  end

  def install
    bin.install "claudectl"
    generate_completions_from_executable(bin/"claudectl", "completions")
  end

  test do
    help = shell_output("#{bin}/claudectl --help")
    assert_match "Usage:", help
    assert_match "claudectl", help
    assert_path_exists bash_completion/"claudectl"
    assert_path_exists zsh_completion/"_claudectl"
    assert_path_exists fish_completion/"claudectl.fish"
  end
end
