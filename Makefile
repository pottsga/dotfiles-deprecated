install:
	ln -s .bash_profile ~/.bash_profile
	ln -s .bashrc ~/.bashrc
	ln -s .gitconfig ~/.gitconfig
	ln -s .vim ~/.vim
	ln -s .vimrc ~/.vimrc
	mkdir -p .config/nvim
	ln -s .config/nvim/init.vim 
	ln -s .tmux.conf ~/.tmux.conf
