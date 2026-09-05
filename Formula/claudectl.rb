class Claudectl < Formula
  desc "Manage multiple Claude Code accounts"
  homepage "https://github.com/Sawmills/claudectl"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.2/claudectl_v0.1.2_Darwin_arm64.tar.gz"
      sha256 "dfc101162d4b3d840af490bc97e395dc92e2e9200470fead6b3a0791cf238dc8"
    else
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.2/claudectl_v0.1.2_Darwin_x86_64.tar.gz"
      sha256 "839444d3d1c90dd28c696c6b436f33aed1cd065b52a284ed970238b9f36ed93a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/claudectl/releases/download/v0.1.2/claudectl_v0.1.2_Linux_x86_64.tar.gz"
      sha256 "e95eb05084b4de45159b9e26817a7f4a07d1b08fe78dfcba56336f788ef9c7cb"
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
