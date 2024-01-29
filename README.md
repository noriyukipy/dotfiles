# dotfiles

## Preparation

Install dependencies first.

```sh
# for MacOS with Homebrew package manager
$ brew install ansible tmux go zsh tmux-mem-cpu-load peco
```

Install Visual Studio Code, and install `code` command from it.

After that, check `[all:vars]` section in `inventory.ini` to confirm your config path is correct. 

## Before execution

### vscode

To keep current extensions, execute `code` command with `--list-extensions` option.

```sh
$ code --list-extensions >vscode/extensions.txt
```

If you want to uninstall all extensions before applying playbook, execute following command to uninstall all installed extensions.

```sh
$ code --list-extensions | xargs -n1 -I{} code --uninstall-extension {}
```

## Set dot files

Execute `ansible-playbook` command.

```sh
$ ansible-playbook -i inventory.ini main.yml --connection=local
```
