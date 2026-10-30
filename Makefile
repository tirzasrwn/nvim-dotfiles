.PHONY: test fmt keymaps hooks

NVIM ?= nvim
STYLUA ?= $(HOME)/.local/share/nvim/mason/bin/stylua

test:
	$(NVIM) --headless -c 'luafile tests/smoke.lua'

fmt:
	$(STYLUA) lua/ tests/ init.lua

keymaps:
	$(NVIM) --headless -c 'luafile tests/gen-keymaps.lua'

# Aktifkan .githooks (pre-commit: stylua check + smoke test)
hooks:
	git config core.hooksPath .githooks
	chmod +x .githooks/*
