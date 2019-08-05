# dotfiles

make install

backup original dotfiles to $HOME/.mydotfiles.backup and make symbolic links to this repo

make uninstall

restore original dotfiles from backup

## VIM

### Main

* [Why vim (in russian)](https://guides.hexlet.io/vim/)
* Switch <kbd>ctrl</kbd> and <kbd>caps</kbd>
* Use <kbd>ctrl</kbd><kbd>[</kbd> instead of <kbd>esc</kdb>
* Plugin manager [junegunn/vim-plug](https://github.com/junegunn/vim-plug)

### File Tree and buffers

* <kbd><leader><leader><kbd> - [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* <kbd><ctrl>h</kbd> - move left to left split
* <kbd><ctrl>l</kbd> - move right to right split
* <kbd><ctrl>k</kbd> - move up to top split
* <kbd><ctrl>j</kbd> - move down to bottom split
* <kbd><leader>b</kbd> - show buffer list [jeetsukumaran/vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator)
* <kbd>gb</kbd> and <kbd>gB</kbd> to flip through the most-recently used buffer stack

### Editing

* `gcc` - toggle commenting [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
* `<tab>` - autocomplete [lifepillar/vim-mucomplete](https://github.com/lifepillar/vim-mucomplete)

## 42
I recommend
* using bash as instructions say `chsh -s /bin/bash`
* using [pbondoer/vim-42header](https://github.com/pbondoer/vim-42header) and setting enviromental variable MAIL for 42 header
* setting `alias gcc='gcc -Wall -Wextra -Werror'` and `alias norminette='norminette -R CheckForbiddenSourceHeader'` (see my `.bash_aliases` and `.bashrc` files)

