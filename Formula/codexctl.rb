class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.13/codexctl_v0.1.13_Darwin_arm64.tar.gz"
      sha256 "62d43d46bc3d49420859ac10bf5560782d80c9012cb8142d1dc41db2a385972c"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.13/codexctl_v0.1.13_Darwin_x86_64.tar.gz"
      sha256 "f21e8bf67e60808daefabcc841ffd55021f6ae97637e765c326a8241f2947178"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.13/codexctl_v0.1.13_Linux_x86_64.tar.gz"
      sha256 "7286c83ce2667b7aa3789231ae467a87d76f91a8c64f38c0ada05d3a2413355a"
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
