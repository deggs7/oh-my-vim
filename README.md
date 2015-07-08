oh-my-vim
=========

Make VIM as IDE(python, web)

## Requirement

* flake8
* [Exuberant ctags](http://ctags.sourceforge.net/)

Install flake8
```
pip install flake8
```

Install by brew on MacOs
```
brew install ctags-exuberant
```

#### on MacOS
YouCompleteMe requires Vim 7.3.584+

Don't overwrite the built-in Vim.
Instead, install it from source in a different location or via Homebrew or MacPorts in their default location then add this line to your .bashrc or .profile:
```
alias vim='/usr/local/bin/vim'
alias vimdiff='/usr/local/bin/vimdiff'
```

## Install

```
git clone git@github.com:deggs7/oh-my-vim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
./install.sh
```

Compiling YCM with semantic support for C-family languages:

```
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

Compiling YCM without semantic support for C-family languages:

```
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```

## Update

```
cd ~/.vim
git pull origin
./install.sh
```

## Shortcuts

* ,nt - NERDTree
* ,jh - JSHint
* ,tb - TagbarToggle
* ,ct - Command-T

## Q&A

The C extension must then be built for command-t

```
cd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make
```




## Thanks

* https://github.com/dexteryy/YVim
