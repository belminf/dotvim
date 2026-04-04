init:
	nvim --headless "+Lazy! sync" +qa
	nvim --headless "+TSInstallSync all" +qa
	nvim --headless "+MasonLockRestore" +qa

update:
	nvim --headless "+Lazy! sync" +qa
	nvim --headless "+TSUpdateSync" +qa

restore:
	nvim --headless "+MasonLockRestore" +qa

.PHONY: init update restore
