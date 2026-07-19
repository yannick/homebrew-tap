# homebrew-tap

Personal Homebrew tap.

```sh
brew tap yannick/tap
brew install mlx-serve
```

## How this tap is maintained

- `Formula/mlx-serve.rb` — **binary formula**, bumped automatically by the
  mlx-serve release pipeline (Forgejo builds, signs, and notarizes; the last
  CI step mirrors the tarball to a GitHub release on
  [yannick/mlx-serve](https://github.com/yannick/mlx-serve) — a releases-only
  mirror, the source of truth is a private Forgejo — and pushes the formula
  here). Manual equivalent: `just tap-publish <tag> <tarball>` in the
  mlx-serve repo.
- `Formula/mlx-c.rb` — tap-pinned copy of homebrew-core's mlx-c at the exact
  version the published mlx-serve binaries link against. `mlx-serve` depends
  on the **core** `mlx-c`; install the tap pin explicitly
  (`brew install yannick/tap/mlx-c`) only if core has moved to an
  ABI-incompatible version before a matching mlx-serve build ships.
