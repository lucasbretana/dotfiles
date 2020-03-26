## Dotfiles for various common program
*NOTE*: those scripts and setup file may use some system variables defined per user and since those may contain sensitive information mine are not present here

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

### TO DO
- fix this README file

- move from `i3` to other wm with transparency support
  * use `compton` for transparency, maybe?

- adjust the binaries for better shown

- also list dependencies for the system

- use `.gif` as wallpapers
  * w/ terminal transparency this is going to be sweet
  * also create some floating applications in right vertical
    + for big screens since code uses little space
