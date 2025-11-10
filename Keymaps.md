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
| n | `]d` | Go to next diagnostic |
| n | `[d` | Go to previous diagnostic |
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

## Undotree
| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>u` | Toggle Undotree |

## File / Directory
| Mode | Keys | Action |
|------|------|--------|
| n | `<leader>e` | Open parent directory (oil.nvim) |

## Notes
- Some Telescope mappings inside its prompt (like `<C-k>`, `<C-j>`, `<C-l>`) are internal to Telescope insert mode and not listed here.
- Rust macro expansion (`<leader>le`) only applies when using `rust_analyzer`.
- Conditional breakpoint (`<leader>dB`) prompts for a condition.
