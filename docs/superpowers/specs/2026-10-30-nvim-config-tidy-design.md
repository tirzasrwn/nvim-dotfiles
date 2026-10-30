# Nvim config tidy — design

## Intent

Rapikan `~/.config/nvim` tanpa mengubah perilaku yang sudah dipakai. Semua bug
yang ditemukan saat audit diperbaiki, struktur file disederhanakan, dan
ditambah smoke test supaya kerusakan config langsung kelihatan.

## Goals

- Bug diperbaiki: LSP `servers` salah isi, typo `depedencies`, `[d`/`]d`
  kebalik, `background`/`relativenumber` dobel, spec `catppuccin` dobel.
- Struktur standar: `lua/config/{options,keymaps,lazy}.lua`, `lua/plugins/*.lua`.
- `better-escape.nvim` (deprecated) diganti mapping native `jk`/`jj`.
- `lazy.lua` tanpa boilerplate kickstart.
- `keymaps.md` di-generate dari mapping asli.
- Satu smoke test runnable, tanpa framework.

## Non-goals

- Tidak menambah plugin baru (root `nvim-lspconfig`, `nvim-cmp` tetap).
- Tidak mengubah daftar LSP/formatter/treesitter yang dipakai.
- Tidak menyentuh dotfile lain (tmux, shell).

## Anti-goals

- Keymap yang sekarang dipakai hilang tanpa pengganti.
- Startup lebih lambat dari ~150ms.
- Test yang butuh jaringan atau GUI.

## Constraints

- Neovim 0.12.6, plugin via lazy.nvim, lockfile di-commit.
- Mason sudah punya semua tool; `stylua` hanya ada di mason bin.
- Tidak ada kredensial GitHub di mesin ini, jadi commit tetap lokal.

## Approaches

1. **Minimal fix only** — patch 7 bug, tanpa ubah struktur. Diff kecil, tapi
   `set/`+`remap/`+`config/` tetap tiga tempat untuk hal yang sama, `keymaps.md`
   tetap stale.
2. **Tidy sedang** — bug + buang boilerplate + rename file. Struktur masih
   `set/`/`remap/`, tanpa test otomatis.
3. **Restruktur penuh (dipilih)** — semua di atas + `lua/config/{options,keymaps,
   lazy}.lua` + smoke test + generator `keymaps.md`. Biaya: satu kali
   pemindahan file, tapi ada test yang menjaga sesudahnya.

## Decisions

- Layout akhir:
  - `init.lua` → `require 'config.options'`, `require 'config.keymaps'`, `require 'config.lazy'`
  - `lua/config/options.lua` ← isi `lua/set/init.lua`
  - `lua/config/keymaps.lua` ← isi `lua/remap/init.lua`
  - `lua/config/lazy.lua` ← sisa `lua ../config/lazy.lua`, komentar dibuang
  - `lua/set/`, `lua/remap/` dihapus
- `servers` hanya LSP asli; formatter (`gofumpt`, `goimports`, `prettier`,
  `shfmt`, `stylua`) pindah ke `ensure_installed` mason terpisah.
- Diagnostic keymap: `]d` = next, `[d` = prev.
- `background` dihapus dari options; catppuccin yang menentukannya.
  `relativenumber`/`number` diset sekali.
- `modicator` tidak lagi mendeklarasikan `catppuccin` (sudah jadi plugin utama).
- `better-escape` → `vim.keymap.set('i', {'jk','jj'}, '<Esc>')`, plus `clear_empty_lines`
  tidak direplikasi (perilaku berubah: baris kosong tidak dibersihkan).
- Test: `tests/smoke.lua`, dijalankan `nvim --headless -l tests/smoke.lua`,
  assert: MYVIMRC benar, colorscheme, jumlah plugin, tidak ada warning
  `[lspconfig] config ... not found`, `]d`/`[d` arah benar, semua file
  `lua/**` lolos `luac`/parse.
- `keymaps.md` di-generate `tests/gen-keymaps.lua` (dump mapping + desc).

## Left to the builder

- Urutan commit dan pesan commit.
- Detail format `keymaps.md`.
