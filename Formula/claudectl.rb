class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.0/claudectl_v0.1.0_Darwin_arm64.tar.gz"
      sha256 "8fb65c41ff8c3bcd1f8dd69c2f9c4814d1f7bd4e15d96cc32c7cf03b4f0effd5"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.0/claudectl_v0.1.0_Darwin_x86_64.tar.gz"
      sha256 "634fdbfd17bb528d644daa4162a291902618c87b8acb9c1dd25d8f91c7311fde"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.0/claudectl_v0.1.0_Linux_x86_64.tar.gz"
      sha256 "d01675d59dd9065eaf3dc858e862876dc3fd47e85f274f9a0a515215458579ae"
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
