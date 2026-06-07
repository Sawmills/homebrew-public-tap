class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  version "0.1.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.12/codexctl_v0.1.12_Darwin_arm64.tar.gz"
      sha256 "b326c15ee1b8f0b0329a72af27ad96c0c3f2e3a2c0acb8ca62371aead482bd24"
    else
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.12/codexctl_v0.1.12_Darwin_x86_64.tar.gz"
      sha256 "04a491cbcad97df3ac73dd3186dc1b8137084b459b7520a3fd3ea5bc767cae16"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Sawmills/codexctl/releases/download/v0.1.12/codexctl_v0.1.12_Linux_x86_64.tar.gz"
      sha256 "d563947de8077715dd7cf4a65c9ae9e9e507ff204eeb9c13fbcfafe01ecb14aa"
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
