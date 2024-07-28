# Dotfiles

## Dotfile Manager

[chezmoi](https://github.com/twpayne/chezmoi)

### How to setup on a new machine

1. Initialize chezmoi on your machine with this repo:

```bash
chezmoi init https://github.com/alex-sir/dotfiles
```

2. Check the changes chezmoi will make:

```bash
chezmoi diff
```

3. Apply all the changes if you are satisfied with them:

```bash
chezmoi apply -v
```

4. Pull and apply the latest change from the repo:

```bash
chezmoi update -v
```

- Alternatively, do the four steps above with a single command:

```bash
chezmoi init --apply alex-sir
```

### How to use

- Add an existing file, directory, or symlink to the tracked dotfiles:

```bash
chezmoi add file
```

- Re-add all modified files:

```bash
chezmoi re-add
```

- See what changes have been made to the dotfiles:

```bash
chezmoi diff
```

- Jump to the source directory of the dotfiles:

```bash
chezmoi cd
```

Within the source directory, use Git to add files, make a commit,
push to the remote directory, etc.

## Programs

These are the programs which have dotfiles being tracked in this repo
(some have more than one dotfile):

- [Bash](https://www.gnu.org/software/bash)
- [bat](https://github.com/sharkdp/bat)
- [Cava](https://github.com/karlstav/cava)
- [cmus](https://github.com/cmus/cmus)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Git](https://git-scm.com)
- [kitty](https://github.com/kovidgoyal/kitty)
- [musikcube](https://github.com/clangen/musikcube)
- [Neovim](https://github.com/neovim/neovim)
- [Starship](https://github.com/starship/starship)
- [Vim](https://github.com/vim/vim)
- [Yazi](https://github.com/sxyazi/yazi)
