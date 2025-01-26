update:
	nvim --headless "+Lazy! sync" +qa
	nvim --headless +TSUpdate +qa

.PHONY: update
