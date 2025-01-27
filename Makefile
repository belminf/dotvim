init:
	nvim -c "TSInstallSync maintained" -c q

update:
	nvim --headless "+Lazy! sync" +qa
	nvim -c "TSUpdateSync" -c q

.PHONY: update
