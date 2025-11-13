# Neovim config overview

This setup uses lazy.nvim for plugin management and comes with Treesitter, Telescope, and LSP tools.

## HTML tag auto-close
- Works in HTML/JSX/TSX/etc. via Treesitter autotag.
- Just type `<div>` (or any tag) and `</div>` will be inserted automatically. No completion popups.
- Enabled by: `nvim-treesitter` + `windwp/nvim-ts-autotag`.

If it doesn’t work yet:
1. Open Neovim and run `:Lazy sync` (installs plugins).
2. Open an HTML/TSX/JSX file; Treesitter will auto-install/parsers per config.

## How to see errors
- Current line diagnostics: `gl` or `<leader>e` (shows a floating window with the error/warning under cursor).
- All diagnostics list: `<leader>sd` (uses Telescope diagnostics picker).
- Jump between diagnostics: `]d` (next), `[d` (prev).
- Neovim/runtime/plugin errors: `:messages`.
- Health checks (common issues): `:checkhealth`.

Note: LSP diagnostics require a language server running (use `:Mason` to install servers; see `install_lsp_servers.lua`).

## Fuzzy finding
- `<leader><leader>` opens Telescope file finder (replaces previous mapping that tried to `:so`).
- Requires Telescope (installed) and benefits from `ripgrep` for live grep.
  - macOS: `brew install ripgrep`

If you previously saw an error when pressing space-space (like `E492: Not an editor command`): that was due to a mapping running a non-existent command. It’s now mapped to Telescope instead.

## Keybinds
Leader key: Space

Navigation and editing:
- `<leader>pv` — Explore files (`:Ex`)
- Visual `J` — Move selection down
- Visual `K` — Move selection up
- `J` — Join lines (keep cursor)
- `<C-d>` / `<C-u>` — Half-page down/up and center
- `n` / `N` — Next/Prev search result and center
- Insert `<C-c>` — Exit insert mode
- `Q` — Disabled

Clipboard and paste:
- Visual `<leader>p` — Paste over selection without yanking it
- `{n,v} <leader>y` — Yank to system clipboard
- `n <leader>Y` — Yank line to system clipboard
- `{n,v} <leader>d` — Delete to black hole register

Telescope (fuzzy find):
- `<leader><leader>` — Find files
- `<leader>ff` — Find files
- `<leader>fg` — Live grep
- `<leader>fb` — Buffers
- `<leader>fh` — Help tags
- `<leader>sd` — Workspace diagnostics

Diagnostics:
- `gl` — Show diagnostics for line
- `<leader>e` — Show diagnostics for line
- `]d` / `[d` — Next/Prev diagnostic

Quickfix/location:
- `<C-k>` / `<C-j>` — Quickfix next/prev
- `<leader>k` / `<leader>j` — Location list next/prev

LSP/format:
- `<leader>f` — Format buffer (requires LSP formatter)

Utilities:
- `<leader>s` — Substitute current word across buffer
- `<leader>x` — Make current file executable
- `<C-f>` — Open tmux-sessionizer in a new tmux window (requires tmux + script)
- `<leader>vpp` — Open a specific config file (path may be stale)

## Common commands
- `:Lazy sync` — Install/update plugins
- `:TSUpdate` — Update Treesitter parsers
- `:Mason` — Manage LSP servers
- `:checkhealth` — Diagnose environment issues
- `:messages` — Show last messages/errors

## Notes
- FZF is not installed in this config. Telescope is the default fuzzy finder. If you want classic fzf instead, we can add `junegunn/fzf` and `junegunn/fzf.vim` (requires the `fzf` binary).
