Dotfiles
========

Dotfiles for various common program
-----------------------------------

*NOTE*: those scripts and setup file may use some system variables defined per user and since those may contain sensitive information mine are not present here

### Directory hierarquy

Currently files are installed following two main rules:
- #1: 'regular files' ( man test, search for -f) are linked accordingly with env
- #2: 'directories' (man test, search for -d) have its inside files linked inside the the directory accordingly with env

When installing all know that files are listed with a limited depth from inside `home`, i.e., files direclty inside home are linked, folders skipped; files inside a folder directly inside `home/` have its content linked inside the directory specified in env
E.g.:
- `home/vimrc` -> `~/.vimrc`
- `home/local/*` -> `~/.local/`


#### vimrc

- my minimalist vim setup tested against Vi IMproved v. 8.0
- I try to not use any external plugin on vim

#### bashrc and similar scripts

- since most of the setup are login independent most of the configuration in the bashrc file

- environment setup is made in two files
  + .benv contains any common ambience values
  + .benv.priv contains sensitive info

- my bash setup is dived into 4 main parts
  + .bash\_profile runs bashrc, so I'm sure every login shell also runs bashrc
  + .bashrc is the main file, it loads the other (if present) and do some bash setup
  + .baliases define some common aliases
    * this file uses shell variables heavily
  + .bfunctions common scripts functions, some may have a doc info
