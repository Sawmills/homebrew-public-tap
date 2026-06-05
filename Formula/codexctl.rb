class Codexctl < Formula
  desc "Manage multiple OpenAI Codex CLI accounts"
  homepage "https://github.com/Sawmills/codexctl"
  url "https://github.com/Sawmills/codexctl.git",
      using:    :git,
      tag:      "v0.1.4",
      revision: "6624a1ebaea03e71ae8660df3c9cc73be7dab469"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"codexctl", "completions")
  end

  test do
    assert_match "Manage multiple Codex CLI accounts", shell_output("#{bin}/codexctl --help")
    assert_path_exists bash_completion/"codexctl"
    assert_path_exists zsh_completion/"_codexctl"
    assert_path_exists fish_completion/"codexctl.fish"
  end
end
