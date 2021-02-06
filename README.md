# A Level 1 Coders dotfiles repo

This is the repository to manage A Level 1 Coders dotfiles. Additional links, 
references, and documentation will be added at a later date.

---

## Adding new files/folders to the directory
When adding new files/folders, first get them all setup in the home directory (or 
intended config directory.)
Once that's done, you'll want to move it to the dotfiles directory and make a 
symlink for it. You can do it like so :

```
$ mv .new_dotfile ~/dotfiles/

$ ln -sv ~/dotfiles/.new_dotfile path/to/where/dotfile/normally/belongs

```

This way, you can make edits to the file and push the changes to git without 
needing to worry about copying the files to arbitrary locations. 
It's a one and done kind of deal.

### Dotfile intended locations
To keep track of where the dotfiles should go, we'll keep a list of the 
dotfiles themselves and their locations for future use. 
This will also help down the line should I end up managing far more dot files 
than the starting 3.

** Home Directory (~) **
- .sterminalrc
- .vimrc
- .zshrc
- .p10k.zsh


---

## Dotfile Directories
These directories contain the configs and plugins to certain core dotfiles. Such as configs and plugins for vim and zsh.

- .vim
- .oh-my-zsh

