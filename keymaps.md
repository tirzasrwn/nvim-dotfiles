# Keymaps

Leader key: `<space>` &nbsp;·&nbsp; Local leader: `<space>`

User-defined keymaps for this Neovim configuration. Mappings are grouped by the
file they live in. Use `<leader>sk` to fuzzy-search all keymaps at runtime.

Modes: `n` = Normal, `v` = Visual/Select, `x` = Visual, `t` = Terminal,
`i` = Insert, `s` = Select.

---

## General — `lua/remap/init.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<Esc>` | `:nohlsearch` | Clear search highlight |
| n | `<leader>q` | `vim.diagnostic.setloclist` | Open diagnostic [Q]uickfix list |
| t | `<Esc><Esc>` | `<C-\><C-n>` | Exit terminal mode |
| n | `<left>` | `:"Use h to move!!"<CR>` | Discourage arrow-key use |
| n | `<right>` | `:"Use l to move!!"<CR>` | Discourage arrow-key use |
| n | `<up>` | `:"Use k to move!!"<CR>` | Discourage arrow-key use |
| n | `<down>` | `:"Use j to move!!"<CR>` | Discourage arrow-key use |
| n | `<C-d>` | `<C-d>zz` | Half-page down, keep cursor centered |
| n | `<C-u>` | `<C-u>zz` | Half-page up, keep cursor centered |
| n | `n` | `nzz` | Next search match, keep cursor centered |
| n | `N` | `Nzz` | Previous search match, keep cursor centered |
| n | `{` | `{zz` | Previous paragraph, keep cursor centered |
| n | `}` | `}zz` | Next paragraph, keep cursor centered |
| n | `]]` | `]]zz` | Next section, keep cursor centered |
| n | `G` | `Gzz` | End of file, keep cursor centered |
| v | `J` | `:m '>+1<CR>gv=gv` | Move visual selection down |
| v | `K` | `:m '<-2<CR>gv=gv` | Move visual selection up |
| x, v | `<leader>P` | `"_dP` | Paste over selection (blackhole delete + paste) |
| n | `<leader>p` | `"+p` | Paste from system clipboard |
| n, v, x | `<leader>y` | `"+y` | Yank to system clipboard |
| n | `<leader>Y` | `"+Y` | Yank line to system clipboard |
| n, v, x | `<leader>d` | `"_d` | Delete into blackhole register |
| n | `<C-f>` | `tmux-sessionizer` | Open tmux-sessionizer in new tmux window |
| n | `<leader>lo` | `vim.diagnostic.open_float` | diagnostic.open_float |
| n | `[d` | `vim.diagnostic.goto_next` | diagnostic.goto_next |
| n | `]d` | `vim.diagnostic.goto_prev` | diagnostic.goto_prev |

---

## Telescope — `lua/plugins/telescope.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>sh` | `builtin.help_tags` | [S]earch [H]elp |
| n | `<leader>sk` | `builtin.keymaps` | [S]earch [K]eymaps |
| n | `<leader>sf` | `builtin.find_files` | [S]earch [F]iles |
| n | `<leader>ss` | `builtin.builtin` | [S]earch [S]elect Telescope |
| n | `<leader>sw` | `builtin.grep_string` | [S]earch current [W]ord |
| n | `<leader>sg` | `builtin.live_grep` | [S]earch by [G]rep |
| n | `<leader>sd` | `builtin.diagnostics` | [S]earch [D]iagnostics |
| n | `<leader>sr` | `builtin.resume` | [S]earch [R]esume |
| n | `<leader>s.` | `builtin.oldfiles` | [S]earch Recent Files (`.` for repeat) |
| n | `<leader>/` | `current_buffer_fuzzy_find` (ivy theme) | `[/]` Fuzzily search in current buffer |
| n | `<leader>s/` | `builtin.live_grep` (open files) | [S]earch `[/]` in Open Files |
| n | `<leader>sn` | `builtin.find_files` (config dir) | [S]earch [N]eovim files |

---

## LSP — `lua/plugins/nvim-lspconfig.lua`

> All LSP keymaps are **buffer-local** and only active after an LSP attaches
> (`LspAttach` autocmd).

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `gd` | `telescope.lsp_definitions` | LSP: [G]oto [D]efinition |
| n | `gr` | `telescope.lsp_references` | LSP: [G]oto [R]eferences |
| n | `gI` | `telescope.lsp_implementations` | LSP: [G]oto [I]mplementation |
| n | `<leader>D` | `telescope.lsp_type_definitions` | LSP: Type [D]efinition |
| n | `<leader>ds` | `telescope.lsp_document_symbols` | LSP: [D]ocument [S]ymbols |
| n | `<leader>ws` | `telescope.lsp_dynamic_workspace_symbols` | LSP: [W]orkspace [S]ymbols |
| n | `<leader>rn` | `vim.lsp.buf.rename` | LSP: [R]e[n]ame |
| n, x | `<leader>ca` | `vim.lsp.buf.code_action` | LSP: [C]ode [A]ction |
| n | `gD` | `vim.lsp.buf.declaration` | LSP: [G]oto [D]eclaration |
| n | `<leader>th` | `vim.lsp.inlay_hint.enable` | LSP: [T]oggle Inlay [H]ints (only if server supports it) |

---

## Harpoon — `lua/plugins/harpoon.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>a` | `harpoon:list():add()` | Harpoon add file to list |
| n | `<C-e>` | `harpoon.ui:toggle_quick_menu` | Toggle Harpoon quick menu |
| n | `<C-h>` | `harpoon:list():select(1)` | Jump to Harpoon file 1 |
| n | `<C-j>` | `harpoon:list():select(2)` | Jump to Harpoon file 2 |
| n | `<C-k>` | `harpoon:list():select(3)` | Jump to Harpoon file 3 |
| n | `<C-l>` | `harpoon:list():select(4)` | Jump to Harpoon file 4 |
| n | `<C-p>` | `harpoon:list():prev()` | Previous Harpoon file |
| n | `<C-n>` | `harpoon:list():next()` | Next Harpoon file |

---

## FTerm — `lua/plugins/fterm.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<C-a>` | `require("FTerm").toggle()` | Toggle floating terminal |
| t | `<C-a>` | exit terminal-mode then toggle FTerm | Toggle floating terminal from terminal mode |

---

## NvimTree — `lua/plugins/nvim-tree.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<C-\>` | `:NvimTreeToggle<CR>` | Toggle file tree |

---

## Fugitive — `lua/plugins/fugitive.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>gs` | `vim.cmd.Git` | Open :Git status |

---

## Undotree — `lua/plugins/undotree.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>u` | `vim.cmd.UndotreeToggle` | UndotreeToggle |

---

## 99 (AI assist) — `lua/plugins/99.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| v | `<leader>9v` | `_99.visual()` | Send visual selection to 99 |
| n | `<leader>9x` | `_99.stop_all_requests()` | Stop all 99 requests |
| n | `<leader>9s` | `_99.search()` | 99 search |

---

## nvim-jdtls — `lua/plugins/nvim-jdtls.lua`

> Active in `java` filetypes only.

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>lc` | `require("jdtls").compile("full")` | jdtls.compile |

---

## springboot-nvim — `lua/plugins/springboot-nvim.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>Jr` | `springboot_nvim.boot_run` | Spring Boot Run Project |
| n | `<leader>Jc` | `springboot_nvim.generate_class` | Java Create Class |
| n | `<leader>Ji` | `springboot_nvim.generate_interface` | Java Create Interface |
| n | `<leader>Je` | `springboot_nvim.generate_enum` | Java Create Enum |

---

## Hurl — `lua/plugins/hurl.lua`

> Active in `hurl` filetypes only.

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>H` | `:HurlRunner<CR>` | Run All requests |
| n | `<leader>h` | `:HurlRunnerAt<CR>` | Run Api request |

---

## Completion (Insert) — `lua/plugins/nvim-cmp.lua`

> Active in insert mode while the nvim-cmp completion menu is open.

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| i | `<C-n>` | `cmp.mapping.select_next_item()` | Select next completion item |
| i | `<C-p>` | `cmp.mapping.select_prev_item()` | Select previous completion item |
| i | `<C-b>` | `cmp.mapping.scroll_docs(-4)` | Scroll documentation back |
| i | `<C-f>` | `cmp.mapping.scroll_docs(4)` | Scroll documentation forward |
| i | `<C-y>` | `cmp.mapping.confirm({ select = true })` | Accept completion (yes) |
| i | `<CR>` | `cmp.mapping.confirm({ select = true })` | Confirm with Enter |
| i | `<Tab>` | `cmp.mapping.select_next_item()` | Next item (or snippet jump) |
| i | `<S-Tab>` | `cmp.mapping.select_prev_item()` | Previous item |
| i | `<C-Space>` | `cmp.mapping.complete()` | Manually trigger completion |
| i, s | `<C-l>` | `luasnip.expand_or_jump` | Expand snippet / jump forward |
| i, s | `<C-h>` | `luasnip.jump(-1)` | Jump snippet placeholder backwards |

---

## Treesitter — `lua/plugins/nvim-treesitter.lua`

### Incremental selection

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<C-Space>` | init selection | Start treesitter incremental selection |
| n | `<C-Space>` | node incremental | Expand selection to next node |
| n | `<C-s>` | scope incremental | Expand selection to next scope |
| n | `<M-Space>` | node decremental | Shrink selection by one node |

### Textobjects — select

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n, x | `aa` | `@parameter.outer` | Select outer parameter |
| n, x | `ia` | `@parameter.inner` | Select inner parameter |
| n, x | `af` | `@function.outer` | Select outer function |
| n, x | `if` | `@function.inner` | Select inner function |
| n, x | `ac` | `@class.outer` | Select outer class |
| n, x | `ic` | `@class.inner` | Select inner class |

### Textobjects — move

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `]m` | `@function.outer` (next start) | Jump to next function start |
| n | `]]` | `@class.outer` (next start) | Jump to next class start |
| n | `]M` | `@function.outer` (next end) | Jump to next function end |
| n | `][` | `@class.outer` (next end) | Jump to next class end |
| n | `[m` | `@function.outer` (prev start) | Jump to previous function start |
| n | `[[` | `@class.outer` (prev start) | Jump to previous class start |
| n | `[M` | `@function.outer` (prev end) | Jump to previous function end |
| n | `[]` | `@class.outer` (prev end) | Jump to previous class end |

---

## Notes

- LSP keymaps are buffer-local and only become available once a language server
  attaches to the buffer.
- nvim-cmp insert-mode keymaps only take effect while the completion menu is
  visible.
- Several plugins register their own default keymaps that are not enumerated
  here (e.g. gitsigns' `]c` / `[c` / `<leader>hs`, fterm window-local mappings,
  nvim-tree's buffer-local tree mappings). Run `<leader>sk` (Telescope
  `[S]earch [K]eymaps`) for a live, searchable list of every active mapping.
