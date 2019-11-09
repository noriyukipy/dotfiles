# dotfiles

## Preparation

This repository uses Ansible to install dotfiles to your localhost node.
Prepare following items before run Ansible.

1. Install Ansible.
2. Check `[all:vars]` section in `inventory.ini` to confirm your config path is correct. 

## Install

Execute `ansible-playbook` command.

```sh
$ ansible-playbook -i inventory.ini main.yml --connection=local
```
## Config

### vscode

To keep current extensions, execute `code` command with `--list-extensions` option.

```sh
$ code --list-extensions >.vscode/extensions.txt
```

If you want to uninstall all extensions before applying playbook, execute following command to uninstall all installed extensions.

```sh
$ code --list-extensions | xargs -n1 -I{} code --uninstall-extension {}
```
