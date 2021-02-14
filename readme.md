# Nix pack nix-dev-jcleng-php71-darwin


## Build or Install in Nix Environment

### Build

To build this program by Nix, clone or download this project and run the following command at the root directory of the project:

```bash
nix-build
```

or the long version by specifying the file: `nix-build default.nix`, or even doing instantiate and realise step-by-step: `nix-store -r $(nix-instantiate default.nix)`.

### Install

To install this program in Nix Environment, run the following command at the root directory of the project:

```bash
nix-env -i -f default.nix
```

or the long version: `nix-env --install --file default.nix`.

### Inspect

You can get the out path by running `nix-store -q --outputs $(nix-instantiate default.nix)` or `nix eval '("${import ./default.nix}")'` before installation, or `nix-env -q --out-path --no-name hello` after installing.

To see the contents of the .drv file, run: `nix show-derivation $(nix-instantiate default.nix)` or `nix show-derivation $(nix-store -q --deriver $(nix eval '("${import ./default.nix}")' | cut -d '"' -f 1))`.


## References

- [Nix Pills](https://nixos.org/nixos/nix-pills/)

## INFO

```shell
# 关闭了pear，不然没有ssl证书文件，make的时候下载https会异常
--without-pear

```


### Share Use

```shell
# add channel
nix-channel --add https://github.com/jcleng/nix-dev-jcleng-php72-darwin/archive/dev-jcleng-php71-darwin-7.1.13.tar.gz dev-jcleng-php71-darwin

# use cachix binary file
cachix use jcleng-pub

# update
nix-channel --update

# search
nix-env -aqP|grep jcleng

# install
nix-env -i dev-jcleng-php71-darwin
```
