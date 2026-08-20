class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.20/codexctl_v0.1.20_Darwin_arm64.tar.gz"
      sha256 "67212d4e68bd701555cbc5bcbde11420acffa68611600d5559e93e98d261e92a"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.20/codexctl_v0.1.20_Darwin_x86_64.tar.gz"
      sha256 "544c84c81a171f85514deb0ce0827f861c6546d21e208b689a441559ba268bb7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.20/codexctl_v0.1.20_Linux_x86_64.tar.gz"
      sha256 "4fd2b9c4d7997a1470961a0992deded689ae5272ac043e052e93c2160790bcdd"
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
