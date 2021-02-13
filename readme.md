# Nix pack kangle-3.5.13.2(linux-centos7)

This is forked https://github.com/zetavg/nix-hello-world

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



...
Installing man pages:             /nix/store/19lx7dbjmr7ypcijbj86v523f13pq9wp-dev-jcleng-php72-darwin-7.2.33/php/man/man1/
  page: phpize.1
  page: php-config.1
Installing PEAR environment:      /nix/store/19lx7dbjmr7ypcijbj86v523f13pq9wp-dev-jcleng-php72-darwin-7.2.33/lib/php/php/

Warning: fopen(): SSL operation failed with code 1. OpenSSL Error messages:
error:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed in /private/tmp/nix-build-dev-jcleng-php72-darwin-7.2.33.drv-0/src/pear/fetch.php on line 66

Warning: fopen(): Failed to enable crypto in /private/tmp/nix-build-dev-jcleng-php72-darwin-7.2.33.drv-0/src/pear/fetch.php on line 66

Warning: fopen(https://pear.php.net/install-pear-nozlib.phar): failed to open stream: operation failed in /private/tmp/nix-build-dev-jcleng-php72-darwin-7.2.33.drv-0/src/pear/fetch.php on line 66

Error..
fopen(https://pear.php.net/install-pear-nozlib.phar): failed to open stream: operation failed
make: *** [Makefile:499: install-pear] Error 1
builder for '/nix/store/dhpnk2azmrgfpk03zmx9iljp377zz6j0-dev-jcleng-php72-darwin-7.2.33.drv' failed with exit code 2
error: build of '/nix/store/dhpnk2azmrgfpk03zmx9iljp377zz6j0-dev-jcleng-php72-darwin-7.2.33.drv' failed
```


### Share Use

```shell
# add channel
nix-channel --add https://github.com/jcleng/nix-dev-jcleng-php72-darwin/archive/master.tar.gz dev-jcleng-php72-darwin

# use cachix binary file
cachix use jcleng-pub

# update
nix-channel --update

# search
nix-env -aqP|grep jcleng

# install
nix-env -i dev-jcleng-php72-darwin
```
