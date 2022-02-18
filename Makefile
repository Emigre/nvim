.DEFAULT_GOAL := config

.PHONY: config
config:
	@nvim --version > /dev/null && if [[ "$$?" = "0" ]]; then \
		echo "$$(nvim --version | head -n 1)"; \
	fi;
	@if [[ ! -L "$$HOME/.config/nvim" ]] && [[ ! -d "$$HOME/.config/nvim" ]]; then \
		ln -s "$(CURDIR)/config" "$$HOME/.config/nvim"; \
		echo "- linked \"$$HOME/.config/nvim\""; \
	else \
		echo "- unable to link!... the \"$$HOME/.config/neovim\" folder already exists"; \
	fi;
	@echo 'Done'

.PHONY: clean
clean:
	@if [[ -L "$$HOME/.config/nvim" ]]; then \
		unlink "$$HOME/.config/nvim"; \
		echo "- unlinked \"$$HOME/.config/neovim\""; \
	else \
		echo "- unable to unlink!... \"$$HOME/.config/neovim\" is not a symlink or does not exist"; \
		exit 1; \
	fi;
	@echo 'Done'
