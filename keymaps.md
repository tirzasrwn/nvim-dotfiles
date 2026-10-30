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

## Normal

| Key | Aksi | Deskripsi |
| --- | ---- | --------- |
| `<Space>Jc` | `(lua)` | Java Create Class |
| `<Space>Je` | `(lua)` | Java Create Enum |
| `<Space>Ji` | `(lua)` | Java Create Interface |
| `<Space>Jr` | `(lua)` | Spring Boot Run Project |
| `<Space>Y` | `"+Y` | Yank line ke clipboard sistem |
| `<Space>a` | `(lua)` | Harpoon tambah file |
| `<Space>bd` | `(lua)` | Hapus buffer |
| `<Space>bo` | `(lua)` | Tutup buffer lain |
| `<Space>d` | `"_d` | Delete ke blackhole register |
| `<Space>f` | `(lua)` | [F]ormat buffer |
| `<Space>gg` | `(lua)` | LazyGit |
| `<Space>gs` | `(lua)` | vim.cmd.Git |
| `<Space>h` | `(lua)` | Run Api request |
| `<Space>lc` | `(lua)` | jdtls.compile |
| `<Space>lo` | `(lua)` | Diagnostic open float |
| `<Space>p` | `"+p` | Paste dari clipboard sistem |
| `<Space>q` | `(lua)` | Open diagnostic [Q]uickfix list |
| `<Space>qr` | `(lua)` | Restore session |
| `<Space>qs` | `(lua)` | Simpan session |
| `<Space>rb` | `(lua)` | Replace di buffer ini |
| `<Space>rr` | `(lua)` | Replace se-project |
| `<Space>tz` | `<Cmd>setlocal spell!<CR>` | Toggle spell |
| `<Space>u` | `(lua)` | UndotreeToggle |
| `<Space>y` | `"+y` | Yank ke clipboard sistem |
| `<lt>C-A>` | `(lua)` | Toggle terminal float |
| `<lt>C-Bslash>` | `<Cmd>NvimTreeToggle<CR>` | Toggle NvimTree |
| `<lt>C-D>` | `<C-D>zz` |  |
| `<lt>C-E>` | `(lua)` | Harpoon menu |
| `<lt>C-F>` | `<Cmd>silent !tmux neww tmux-sessionizer<CR>` | Tmux sessionizer |
| `<lt>C-H>` | `(lua)` | Harpoon file 1 |
| `<lt>C-J>` | `(lua)` | Harpoon file 2 |
| `<lt>C-K>` | `(lua)` | Harpoon file 3 |
| `<lt>C-L>` | `(lua)` | Harpoon file 4 |
| `<lt>C-N>` | `(lua)` | Harpoon berikutnya |
| `<lt>C-P>` | `(lua)` | Harpoon sebelumnya |
| `<lt>C-Space>` | `(lua)` | Treesitter select parent |
| `<lt>C-U>` | `<C-U>zz` |  |
| `<lt>C-W><lt>C-D>` | `<C-W>d` | Show diagnostics under the cursor |
| `<lt>C-W>d` | `(lua)` | Show diagnostics under the cursor |
| `<lt>Down>` | `<Cmd>echo "Use j to move!!"<CR>` |  |
| `<lt>Esc>` | `<Cmd>nohlsearch<CR>` |  |
| `<lt>Left>` | `<Cmd>echo "Use h to move!!"<CR>` |  |
| `<lt>M-Space>` | `(lua)` | Treesitter select child |
| `<lt>M-h>` | `<C-W>h` | Window kiri |
| `<lt>M-j>` | `<C-W>j` | Window bawah |
| `<lt>M-k>` | `<C-W>k` | Window atas |
| `<lt>M-l>` | `<C-W>l` | Window kanan |
| `<lt>Right>` | `<Cmd>echo "Use l to move!!"<CR>` |  |
| `<lt>Up>` | `<Cmd>echo "Use k to move!!"<CR>` |  |
| `G` | `Gzz` |  |
| `H` | `(lua)` | Buffer sebelumnya |
| `L` | `(lua)` | Buffer berikutnya |
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

## Insert

| Key | Aksi | Deskripsi |
| --- | ---- | --------- |
| `<lt>C-S>` | `(lua)` | vim.lsp.buf.signature_help() |
| `<lt>S-Tab>` | `(lua)` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<lt>Tab>` | `(lua)` | vim.snippet.jump if active, otherwise <Tab> |
| `jj` | `<Esc>` |  |
| `jk` | `<Esc>` |  |

