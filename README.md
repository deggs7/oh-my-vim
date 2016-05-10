oh-my-vim
=========

Make VIM as IDE(python, web)

## Requirement

* flake8
* ack
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

The following additional language support options are available:

C# support: add --omnisharp-completer when calling ./install.py.
Go support: ensure go is installed and add --gocode-completer when calling ./install.py.
TypeScript support: install nodejs and npm then install the TypeScript SDK with npm install -g typescript.
JavaScript support: install nodejs and npm and add --tern-completer when calling ./install.py.
Rust support: install rustc and cargo and add --racer-completer when calling ./install.py.
To simply compile with everything enabled, there's a --all flag. So, to install with all language features, ensure npm, go, mono, rust, and typescript API are installed and in your PATH, then simply run:

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
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
