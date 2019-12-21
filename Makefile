

install: cpp rust haskell system vim ranger

cpp:
	sudo apt install -y build-essential clang valgrind

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup update

haskell:
	curl https://gitlab.haskell.org/haskell/ghcup/raw/master/bootstrap-haskell -sSf | sh
	ghcup install
	ghcup install-cabal
	cabal new-install cabal-install

system:
	sudo add-apt-repository ppa:wireguard/wireguard
	sudo apt update && sudo apt dist-upgrade
	sudo apt install -y wireguard ranger neovim

vim:
	cp ./nvim ~/.config/

ranger:
	cp ./nvim ~/.config/
