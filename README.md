# Personal dotfiles
Here is where I stow all my personal dotfiles I use. Most are based on premade dots from someone else (Such as Nvim) or only the the edited I've made to the ornignal dots so that I can update them without having to majorly edit mine. Credit to the original dots can be found in each folder with a link to each project.  
## Stow
These dots are formated to be used with GNU Stow. Stow Creates Symlinks to different location depending on the tree created in the orgininal folder. Stow also don't like removing existing Dots so make sure to delete/backup old Dots before using Stow. for more information on Stow just go to there website and install it with your package mananger of choice.


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