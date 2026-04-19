MASON_WAIT = +lua vim.wait(300000,function() local ok,reg=pcall(require,'mason-registry') if not ok then return false end for _,p in ipairs(reg.get_all_packages()) do if p:get_handle() then return false end end return true end,500)

setup:
	$(MAKE) deps
	$(MAKE) init

deps:
	@if [ "$$(uname)" = "Darwin" ]; then \
	  $(MAKE) deps-mac; \
	else \
	  $(MAKE) deps-arch; \
	fi

deps-mac:
	brew install \
	  ansible-language-server bash-language-server biome fd fzf git go jsonlint \
	  markdownlint-cli2 neovim node npm prettier python3 pyright ripgrep ruby \
	  hashicorp/tap/terraform vscode-langservers-extracted wget yaml-language-server

deps-arch:
	yay -S \
	  ansible-language-server bash-language-server biome fd fzf git go jsonlint \
	  markdownlint-cli2 neovim nodejs npm prettier python pyright ripgrep ruby \
	  terraform vscode-langservers-extracted wget yaml-language-server zip

init:
	nvim --headless "+Lazy! sync" +qa
	nvim --headless "+MasonLockRestore" "$(MASON_WAIT)" +qa

update:
	nvim --headless "+Lazy! sync" +qa
	nvim --headless "+TSUpdateSync" +qa

restore:
	nvim --headless "+MasonLockRestore" "$(MASON_WAIT)" +qa

.PHONY: setup deps deps-mac deps-arch init update restore
