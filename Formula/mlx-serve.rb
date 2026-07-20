# Generated from dist/homebrew/mlx-serve.rb.tmpl — do not edit the published
# formula by hand. Placeholders: 0.1.0-rc8 (0.1.0-rc5), v0.1.0-rc8 (v0.1.0-rc5),
# 55865631bb8ec31ca155e03de9055b885fad0f7e457eb46e1a13a574a73fffa0 (tarball digest). Filled by `just tap-formula` locally or by the
# release-macos workflow's tap step in CI.
#
# This is a BINARY formula: the tarball is the signed + notarized arm64 build
# produced by the Forgejo release pipeline and mirrored to a GitHub release on
# github.com/yannick/mlx-serve (a releases-only mirror; the source of truth
# stays on the private Forgejo). The binary links the Homebrew mlx-c and mlx
# dylibs at /opt/homebrew/opt — hence the hard dependencies and the
# arm64/macOS requirement.
class MlxServe < Formula
  desc "OpenAI-compatible continuous-batching server for MLX models (no Python)"
  homepage "https://github.com/yannick/mlx-serve"
  version "0.1.0-rc8"
  url "https://github.com/yannick/mlx-serve/releases/download/v0.1.0-rc8/mlx-serve-v0.1.0-rc8-macos-arm64.tar.gz"
  sha256 "55865631bb8ec31ca155e03de9055b885fad0f7e457eb46e1a13a574a73fffa0"

  depends_on :macos
  depends_on arch: :arm64
  depends_on "mlx"
  depends_on "mlx-c"

  def install
    bin.install "mlx-serve"
    doc.install "README.md", "BUILD-INFO.txt"
    pkgshare.install "mlx-serve.example.yaml"
  end

  def caveats
    <<~EOS
      The binary is Developer ID signed and notarized; it was built against
      the Homebrew mlx-c/mlx current at build time (see BUILD-INFO.txt in
      #{doc}). If a future mlx-c bump breaks ABI, upgrade mlx-serve too.

      Example config: #{pkgshare}/mlx-serve.example.yaml
      Start with:     mlx-serve serve --config <your-config>.yaml
    EOS
  end

  test do
    assert_match "mlx-serve", shell_output("#{bin}/mlx-serve --help")
  end
end
