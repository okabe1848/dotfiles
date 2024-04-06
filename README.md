# dotfiles
vscodeのDevContainerで利用する設定

## Installation

```
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/okabe1848/dotfiles/main/install.sh)"

```

## peco
```
$ cd ~/tmp
$ wget https://github.com/peco/peco/releases/download/v0.2.9/peco_linux_amd64.tar.gz
$ tar -xzvf peco_linux_amd64.tar.gz
$ sudo mv peco_linux_amd64/peco /usr/local/bin/
$ ls | peco
```