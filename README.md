# Personal dotfiles
This is all the dotfiles I used while working with linux. there just for personal use with many of them using other people dot files as a base. Link to the orignals are found in each folder in the readme

## Requirements
all these files are manage by stow which need to be downloaded using this command or Equivalent
### Stow
```
pacman -S stow
```
you also obviously need git
### Git
```
pacman -S Git
```
## Uses
from there you want to pull this repo and save it into your home dir. from there cd into the folder and run
```
stow .
```
you may run into Conflicts if you run this with files already there so go remove or back up all old dot files
