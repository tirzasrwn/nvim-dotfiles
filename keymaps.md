# Keymaps

Di-generate `tests/gen-keymaps.lua`; jangan edit manual.

## Terminal

| Key | Aksi | Deskripsi |
| --- | ---- | --------- |
| `<lt>C-A>` | `(lua)` | Toggle terminal float |
| `<lt>Esc><lt>Esc>` | `<C-\><C-N>` | Exit terminal mode |

## Visual

| Key | Aksi | Deskripsi |
| --- | ---- | --------- |
| `<Space>P` | `"_dP` | Paste tanpa overwrite register |
| `<Space>d` | `"_d` | Delete ke blackhole register |
| `<Space>f` | `(lua)` | [F]ormat buffer |
| `<Space>y` | `"+y` | Yank ke clipboard sistem |
| `<lt>C-Space>` | `(lua)` | Treesitter select parent |
| `<lt>M-Space>` | `(lua)` | Treesitter select child |
| `J` | `:m '>+1<CR>gv=gv` |  |
| `K` | `:m '<lt>-2<CR>gv=gv` |  |
| `[M` | `(lua)` |  |
| `[N` | `(lua)` | Select previous sibling node |
| `[[` | `(lua)` |  |
| `[]` | `(lua)` |  |
| `[m` | `(lua)` |  |
| `[n` | `(lua)` | Select previous node |
| `]M` | `(lua)` |  |
| `]N` | `(lua)` | Select next sibling node |
| `][` | `(lua)` |  |
| `]]` | `(lua)` |  |
| `]m` | `(lua)` |  |
| `]n` | `(lua)` | Select next node |
| `aa` | `(lua)` |  |
| `ac` | `(lua)` |  |
| `af` | `(lua)` |  |
| `an` | `(lua)` | Select parent (outer) node |
| `gc` | `(lua)` | Toggle comment |
| `gra` | `(lua)` | vim.lsp.buf.code_action() |
| `gx` | `(lua)` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `ia` | `(lua)` |  |
| `ic` | `(lua)` |  |
| `if` | `(lua)` |  |
| `in` | `(lua)` | Select child (inner) node |

## Insert

| Key | Aksi | Deskripsi |
| --- | ---- | --------- |
| `<lt>C-S>` | `(lua)` | vim.lsp.buf.signature_help() |
| `<lt>S-Tab>` | `(lua)` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<lt>Tab>` | `(lua)` | vim.snippet.jump if active, otherwise <Tab> |
| `jj` | `<Esc>` |  |
| `jk` | `<Esc>` |  |

## Normal

| Key | Aksi | Deskripsi |
| --- | ---- | --------- |
| `<Space><Space>` | `<Cmd>NvimTreeToggle<CR>` |  |
| `<Space>Jc` | `(lua)` | Java Create Class |
| `<Space>Je` | `(lua)` | Java Create Enum |
| `<Space>Ji` | `(lua)` | Java Create Interface |
| `<Space>Jr` | `(lua)` | Spring Boot Run Project |
| `<Space>Y` | `"+Y` | Yank line ke clipboard sistem |
| `<Space>a` | `(lua)` | Harpoon add file to list |
| `<Space>d` | `"_d` | Delete ke blackhole register |
| `<Space>f` | `(lua)` | [F]ormat buffer |
| `<Space>gs` | `(lua)` | vim.cmd.Git |
| `<Space>h` | `(lua)` | Run Api request |
| `<Space>lc` | `(lua)` | jdtls.compile |
| `<Space>lo` | `(lua)` | Diagnostic open float |
| `<Space>p` | `"+p` | Paste dari clipboard sistem |
| `<Space>q` | `(lua)` | Open diagnostic [Q]uickfix list |
| `<Space>u` | `(lua)` | UndotreeToggle |
| `<Space>y` | `"+y` | Yank ke clipboard sistem |
| `<lt>C-A>` | `(lua)` | Toggle terminal float |
| `<lt>C-D>` | `<C-D>zz` |  |
| `<lt>C-E>` | `(lua)` |  |
| `<lt>C-F>` | `<Cmd>silent !tmux neww tmux-sessionizer<CR>` | Tmux sessionizer |
| `<lt>C-H>` | `(lua)` |  |
| `<lt>C-J>` | `(lua)` |  |
| `<lt>C-K>` | `(lua)` |  |
| `<lt>C-L>` | `(lua)` |  |
| `<lt>C-N>` | `(lua)` |  |
| `<lt>C-P>` | `(lua)` |  |
| `<lt>C-Space>` | `(lua)` | Treesitter select parent |
| `<lt>C-U>` | `<C-U>zz` |  |
| `<lt>C-W><lt>C-D>` | `<C-W>d` | Show diagnostics under the cursor |
| `<lt>C-W>d` | `(lua)` | Show diagnostics under the cursor |
| `<lt>Down>` | `<Cmd>echo "Use j to move!!"<CR>` |  |
| `<lt>Esc>` | `<Cmd>nohlsearch<CR>` |  |
| `<lt>Left>` | `<Cmd>echo "Use h to move!!"<CR>` |  |
| `<lt>M-Space>` | `(lua)` | Treesitter select child |
| `<lt>Right>` | `<Cmd>echo "Use l to move!!"<CR>` |  |
| `<lt>Up>` | `<Cmd>echo "Use k to move!!"<CR>` |  |
| `G` | `Gzz` |  |
| `N` | `Nzz` |  |
| `[<Space>` | `(lua)` | Add empty line above cursor |
| `[<lt>C-L>` | `(lua)` | :lpfile |
| `[<lt>C-Q>` | `(lua)` | :cpfile |
| `[<lt>C-T>` | `(lua)` | :ptprevious |
| `[A` | `(lua)` | :rewind |
| `[B` | `(lua)` | :brewind |
| `[D` | `(lua)` | Jump to the first diagnostic in the current buffer |
| `[L` | `(lua)` | :lrewind |
| `[M` | `(lua)` |  |
| `[Q` | `(lua)` | :crewind |
| `[T` | `(lua)` | :trewind |
| `[[` | `(lua)` |  |
| `[]` | `(lua)` |  |
| `[a` | `(lua)` | :previous |
| `[b` | `(lua)` | :bprevious |
| `[d` | `(lua)` | Diagnostic prev |
| `[l` | `(lua)` | :lprevious |
| `[m` | `(lua)` |  |
| `[q` | `(lua)` | :cprevious |
| `[t` | `(lua)` | :tprevious |
| `]<Space>` | `(lua)` | Add empty line below cursor |
| `]<lt>C-L>` | `(lua)` | :lnfile |
| `]<lt>C-Q>` | `(lua)` | :cnfile |
| `]<lt>C-T>` | `(lua)` | :ptnext |
| `]A` | `(lua)` | :last |
| `]B` | `(lua)` | :blast |
| `]D` | `(lua)` | Jump to the last diagnostic in the current buffer |
| `]L` | `(lua)` | :llast |
| `]M` | `(lua)` |  |
| `]Q` | `(lua)` | :clast |
| `]T` | `(lua)` | :tlast |
| `][` | `(lua)` |  |
| `]]` | `(lua)` |  |
| `]a` | `(lua)` | :next |
| `]b` | `(lua)` | :bnext |
| `]d` | `(lua)` | Diagnostic next |
| `]l` | `(lua)` | :lnext |
| `]m` | `(lua)` |  |
| `]q` | `(lua)` | :cnext |
| `]t` | `(lua)` | :tnext |
| `gO` | `(lua)` | vim.lsp.buf.document_symbol() |
| `gc` | `(lua)` | Toggle comment |
| `gcc` | `(lua)` | Toggle comment line |
| `gra` | `(lua)` | vim.lsp.buf.code_action() |
| `gri` | `(lua)` | vim.lsp.buf.implementation() |
| `grn` | `(lua)` | vim.lsp.buf.rename() |
| `grr` | `(lua)` | vim.lsp.buf.references() |
| `grt` | `(lua)` | vim.lsp.buf.type_definition() |
| `grx` | `(lua)` | vim.lsp.codelens.run() |
| `gx` | `(lua)` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `n` | `nzz` |  |
| `y<lt>C-G>` | `:<C-U>call setreg(v:register, fugitive#Object(@%))<CR>` |  |
| `{` | `{zz` |  |
| `}` | `}zz` |  |

