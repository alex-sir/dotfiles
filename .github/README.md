# dotfiles

## Tool

[chezmoi](https://github.com/twpayne/chezmoi)

> Manage your dotfiles across multiple diverse machines, securely.

## How to setup on a new machine

1. Initialize chezmoi on your machine with the dotfiles repo:

Using HTTPS (default):

```bash
chezmoi init https://github.com/alex-sir/dotfiles
```

Using SSH:

```bash
chezmoi init --ssh https://github.com/alex-sir/dotfiles
```

1. Check the changes chezmoi will make:

```bash
chezmoi diff
```

1. Apply all the changes if you are satisfied with them:

```bash
chezmoi apply -v
```

1. Pull and apply the latest change from the repo:

```bash
chezmoi update -v
```

- Alternatively, do the four steps above with a single command:

Using HTTPS (default):

```bash
chezmoi init --apply alex-sir
```

Using SSH:

```bash
chezmoi init --ssh --apply alex-sir
```

## How to use

- Add an existing file, directory, or symlink to the tracked dotfiles:

```bash
chezmoi add <file>
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

- Remove a target from the source state (keep file in system but not in chezmoi):

```bash
chezmoi forget <file>
```

- Permanently delete an entry from the source state, the destination directory,
  and the state:

```bash
chezmoi destroy <file>
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
- [Neovim](https://github.com/neovim/neovim)
- [Starship](https://github.com/starship/starship)
- [Tealdeer](https://github.com/tealdeer-rs/tealdeer)
- [Yazi](https://github.com/sxyazi/yazi)

Some programs have their configuration only in the `.bashrc` file:

- [fzf](https://github.com/junegunn/fzf)
