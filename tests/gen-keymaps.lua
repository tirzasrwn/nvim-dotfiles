-- Generate keymaps.md dari mapping asli. Jalankan:
--   nvim --headless -c 'luafile tests/gen-keymaps.lua'
local modes = { n = 'Normal', x = 'Visual', i = 'Insert', t = 'Terminal' }
local out = { '# Keymaps', '', 'Di-generate `tests/gen-keymaps.lua`; jangan edit manual.', '' }

for mode, label in pairs(modes) do
  local rows = {}
  for _, m in ipairs(vim.api.nvim_get_keymap(mode)) do
    -- buang mapping bawaan vim dan <Plug>
    local skip = (m.desc or ''):match '^:help' or (m.lhs or ''):find '<Plug>' or (m.rhs or ''):find '<Plug>'
    if not skip then
      local lhs = vim.fn.keytrans(m.lhs or m.rhs or '')
      local rhs = m.rhs and m.rhs ~= '' and m.rhs or (m.callback and '(lua)' or '')
      rows[#rows + 1] = string.format('| `%s` | `%s` | %s |', lhs, (rhs:gsub('|', '\\|')), m.desc or '')
    end
  end
  table.sort(rows)
  if #rows > 0 then
    out[#out + 1] = '## ' .. label
    out[#out + 1] = ''
    out[#out + 1] = '| Key | Aksi | Deskripsi |'
    out[#out + 1] = '| --- | ---- | --------- |'
    vim.list_extend(out, rows)
    out[#out + 1] = ''
  end
end

vim.fn.writefile(out, vim.fn.stdpath 'config' .. '/keymaps.md')
print 'wrote keymaps.md'
vim.cmd 'qa'
