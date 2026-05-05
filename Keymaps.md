# Neovim Keymaps

Leader key: `<Space>`

## General
| Mode | Keys | Action |
|------|------|--------|
| n,v | `<leader>y` | Yank to system clipboard |
| v | `J` | Move selected lines down |
| v | `K` | Move selected lines up |

## Buffers
| Mode | Keys | Action |
|------|------|--------|
| n | `<tab>` | Next buffer |
| n | `<s-tab>` | Previous buffer |
| n | `<leader>x` | Force delete buffer |
| n | `<leader>b` | New empty buffer |

## Display / Toggle
| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>lw` | Toggle line wrap |

## Diagnostics (LSP + built-in)
| Mode | Keys | Action |
|------|------|--------|
| n | `]d` | Go to next diagnostic (any severity) |
| n | `[d` | Go to previous diagnostic (any severity) |
| n | `]e` | Go to next error (Neovim 0.12) |
| n | `[e` | Go to previous error (Neovim 0.12) |
| n | `]w` | Go to next warning (Neovim 0.12) |
| n | `[w` | Go to previous warning (Neovim 0.12) |
| n | `<leader>d` | Open floating diagnostic window |

## Telescope
| Mode | Keys | Action |
|------|------|--------|
| n | `<C-p>` | Find files |
| n | `<leader>fb` | List buffers |
| n | `<leader>ff` | Find files |
| n | `<leader>fF` | Live grep |
| n | `<leader>fs` | Document symbols |
| n | `<leader>fc` | Commands |
| n | `<leader>fy` | Registers |
| n | `gr` | LSP references |
| n | `gI` | LSP implementations |

## LSP
| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>la` | Code action |
| n | `<leader>lf` | Format buffer |
| n | `<leader>lr` | Rename symbol |
| n | `<leader>le` | Rust: Expand macro |
| n | `gD` | Go to declaration |
| n | `gd` | Go to definition |
| n | `K` | Hover documentation |
| n | `<C-k>` | Signature help |
| n | `<leader>lh` | Toggle inlay hints (buffer-local, Neovim 0.12) |
| n | `<leader>lL` | Toggle linked editing range (buffer-local, Neovim 0.12) |

## Debug (nvim-dap)
| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>dd` | Start/Continue |
| n | `<leader>di` | Step into |
| n | `<leader>do` | Step over |
| n | `<leader>du` | Step out |
| n | `<leader>db` | Toggle breakpoint |
| n | `<leader>dB` | Set conditional breakpoint |
| n | `<leader>dR` | Clear breakpoints |
| n | `<leader>dL` | List breakpoints |
| n | `<leader>dl` | Toggle DAP UI (last session result) |

## Git (Fugitive / Gitsigns)
| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>gs` | Open Git (fugitive) |
| n | `]c` | Next hunk |
| n | `[c` | Previous hunk |
| n | `<leader>hs` | Stage hunk |
| v | `<leader>hs` | Stage selected hunk |
| n | `<leader>hr` | Reset hunk |
| v | `<leader>hr` | Reset selected hunk |
| n | `<leader>hS` | Stage buffer |
| n | `<leader>hu` | Undo stage hunk |
| n | `<leader>hR` | Reset buffer |
| n | `<leader>hp` | Preview hunk |
| n | `<leader>hb` | Blame line (full) |
| n | `<leader>tb` | Toggle current line blame |
| n | `<leader>hd` | Diff this |
| n | `<leader>hD` | Diff this against HEAD~ |
| n | `<leader>td` | Toggle deleted |
| o,x | `ih` | Text object: inner hunk |

## Surround (nvim-surround)
Add, change, or delete surrounding pairs: quotes, brackets, tags, etc.

| Mode | Keys | Action |
|------|------|--------|
| n | `ys{motion}{char}` | **Add** surround around `{motion}` (e.g. `ysiw"` → wraps word in `"…"`) |
| n | `yss{char}` | Surround whole line |
| n | `ySS{char}` | Surround whole line, on new lines (multi-line) |
| n | `ds{char}` | **Delete** surround (e.g. `ds"` removes surrounding quotes) |
| n | `cs{old}{new}` | **Change** surround (e.g. `cs'"` → swaps single quotes for double) |
| x | `S{char}` | Surround visual selection |

### Common `{char}` values
- `"` `'` `` ` `` — quotes
- `(` `[` `{` — brackets (space-padded); `)` `]` `}` — tight (no padding)
- `t` — HTML/JSX tag (prompts for tag name)
- `f` — function call (prompts for function name)

### Quick examples
| What you want | Press |
|---|---|
| Wrap word in quotes | `ysiw"` |
| Wrap line in backticks | `yss\`` |
| Change `'foo'` to `"foo"` | `cs'"` |
| Remove surrounding `()` | `ds(` |
| Wrap selected text in `<div>…</div>` | (visual) `St` then type `div` |
| Wrap word in `console.log(…)` | `ysiwf` then type `console.log` |

## Merge / Conflicts (git-conflict + diffview)
Like VSCode's merge editor. `git-conflict.nvim` handles inline resolution in the conflicted file itself; `diffview.nvim` opens a 3-pane merge tool.

### Inline (anywhere a conflicted file is open)
| Mode | Keys | Action |
|------|------|--------|
| n | `]x` | Jump to next conflict |
| n | `[x` | Jump to previous conflict |
| n | `<leader>co` | Choose OURS (current branch) |
| n | `<leader>ct` | Choose THEIRS (incoming) |
| n | `<leader>cb` | Choose BOTH |
| n | `<leader>c0` | Choose NONE (drop the conflict block) |
| n | `<leader>cl` | List all conflicts in quickfix |

### Merge tool / Diffview
| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>gm` | Open merge tool (3-pane view for current conflicts) |
| n | `<leader>gd` | Open Diffview (compare index vs working tree) |
| n | `<leader>gq` | Close Diffview |
| n | `<leader>gh` | File history (current file) |
| n | `<leader>gH` | Project history |

### Inside the Diffview merge view
| Mode | Keys | Action |
|------|------|--------|
| n | `]x` / `[x` | Next / previous conflict |
| n | `<leader>co` / `<leader>ct` / `<leader>cb` / `<leader>c0` | Choose ours / theirs / both / none (at cursor) |
| n | `<leader>cO` / `<leader>cT` / `<leader>cB` | Choose ours / theirs / both for **whole file** |
| n | `<leader>e` | Toggle file panel |
| n | `q` | Close Diffview |

### Typical merge workflow
1. `git merge some-branch` in terminal — conflicts appear.
2. Open nvim in the repo.
3. `<leader>gm` — Diffview merge tool opens showing all conflicted files.
4. Pick a file from the left panel, use `]x` to jump to a conflict, `<leader>co`/`<leader>ct`/`<leader>cb` to resolve.
5. `:w` to save the resolved file. Diffview marks it resolved.
6. Repeat until all files done, then `git commit` from terminal (or `<leader>gs` for fugitive).

## Undotree
| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>u` | Toggle Undotree |

## File / Directory
| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>e` | Open parent directory (oil.nvim) |

## Notes (Telekasten)
Notes live in `~/zettelkasten/` (`daily/`, `weekly/`, `templates/`, `img/`).

| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>zz` | Open Telekasten command panel (menu) |
| n | `<leader>zd` | Open today's daily note (creates from template) |
| n | `<leader>zw` | Open this week's weekly note |
| n | `<leader>zn` | New note (prompts for title) |
| n | `<leader>zf` | Find notes by filename (Telescope) |
| n | `<leader>zg` | Grep inside notes content |
| n | `<leader>zt` | Show all tags, jump to notes with that tag |
| n | `<leader>zb` | Show backlinks to current note |
| n | `<leader>zc` | Calendar view (press `<CR>` on a date) |
| n | `<leader>zi` | Insert `[[link]]` to another note |
| n | `<leader>zI` | Insert image link |
| n | `<leader>zo` | Follow link under cursor |
| n | `<leader>zr` | Rename current note (updates links) |

### Typical daily flow
1. `<leader>zd` — open today's note, jot what you did.
2. `<leader>zn` — spin up a side note (e.g. meeting notes); type a title.
3. Back in the daily note: `<leader>zi` — insert a `[[link]]` to the side note.
4. Later: `<leader>zo` on a link to jump to it; `<leader>zb` to see who links back.
5. `<leader>zc` — calendar to re-open a past day's note.

### Tags
Write `#work` or `#idea` anywhere in a note, then `<leader>zt` to browse them.

## Notes
- Some Telescope mappings inside its prompt (like `<C-k>`, `<C-j>`, `<C-l>`) are internal to Telescope insert mode and not listed here.
- Rust macro expansion (`<leader>le`) only applies when using `rust_analyzer`.
- Conditional breakpoint (`<leader>dB`) prompts for a condition.
- `:lsp` (Neovim 0.12) — interactive LSP client manager. Run `:help :lsp` for subcommands (list/info/start/stop/restart).
- Inlay hints toggle (`<leader>lh`) and linked-editing toggle (`<leader>lL`) are buffer-local — each buffer remembers its own state.
