XDG_CONFIG_HOME ?= "${HOME}/.config"

.PHONY: set
set:
	mkdir -p "${XDG_CONFIG_HOME}"
	
	ln -fsv "${PWD}/src/fzf"    "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/git"    "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/npm"    "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/nvim"   "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/tmux"   "${XDG_CONFIG_HOME}"
	ln -fsv "${PWD}/src/yt-dlp" "${XDG_CONFIG_HOME}"
	
	ln -fsv "${PWD}/src/starship/starship.toml" "${XDG_CONFIG_HOME}/starship.toml"
	
	ln -fsv "${PWD}/src/zsh/.zshrc" "${HOME}/.zshrc"

.PHONY: unset
unset:
	rm -fv "${XDG_CONFIG_HOME}/fzf"
	rm -fv "${XDG_CONFIG_HOME}/git"
	rm -fv "${XDG_CONFIG_HOME}/npm"
	rm -fv "${XDG_CONFIG_HOME}/nvim"
	rm -fv "${XDG_CONFIG_HOME}/tmux"
	rm -fv "${XDG_CONFIG_HOME}/yt-dlp"
	
	rm -fv "${XDG_CONFIG_HOME}/starship.toml"
	
	rm -fv "${HOME}/.zshrc"
