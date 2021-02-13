
{ pkgs ? import <nixpkgs> { } }:
with pkgs;

stdenv.mkDerivation rec {
  pname = "dev-jcleng-php72-darwin";
  version = "7.2.33";

  # src = fetchurl {
  #   url = "mirror://php-7.2.0.tar.gz";
  #   sha256 = "0ssi1wpaf7plaswqqjwigppsg5fyh99vdxx9kzl7c9lng89ndq1i";
  # };
  # 手动下载
  # wget https://github.91chifun.workers.dev//https://github.com/php/php-src/archive/php-7.2.33.tar.gz
  src = ./src;
  # libXpm :https://github.com/NixOS/nixpkgs/commit/f34685600ec397c742a7f5048d57475d0f0b692e
  # libaio
  buildInputs = [ tree coreutils pkg-config re2c libwebp libzip xorg.libXpm bison zlib git libxml2 openssl autoconf automake libtool gcc10  pcre curl libpng libjpeg freetype gd libiconv];
  # doCheck = true;
  # tree -L 3 ${libiconv}
  configurePhase = ''
    echo "初始化:"
    ./buildconf --force
    ./configure \
--prefix=$out \
--exec-prefix=$out \
--bindir=$out/bin \
--sbindir=$out/sbin \
--includedir=$out/include \
--libdir=$out/lib/php \
--mandir=$out/php/man \
--with-config-file-path=$out/etc \
--with-mhash \
--with-openssl \
--with-gd=${gd.dev}/include \
--with-iconv=${libiconv}/ \
--with-zlib=${zlib.dev} \
--with-libzip=${libzip.dev} \
--without-pear \
--enable-zip \
--enable-inline-optimization \
--disable-debug \
--disable-rpath \
--enable-shared \
--enable-xml \
--enable-bcmath \
--enable-shmop \
--enable-sysvsem \
--enable-mbregex \
--enable-mbstring \
--enable-ftp \
--enable-pcntl \
--enable-sockets \
--with-xmlrpc \
--enable-soap \
--enable-session \
--with-curl \
--with-freetype-dir=${freetype.dev} \
--enable-opcache \
--enable-fpm \
--with-fpm-user=www \
--with-fpm-group=www \
--with-png-dir=${libpng.dev} \
--with-jpeg-dir=${libjpeg.dev} \
--with-webp-dir=${libwebp} \
--with-xpm-dir=${xorg.libXpm.dev}
  '';
  installPhase = ''
    echo "编译&&安装:"
    make
    make install
  '';
  meta = with lib; {
    description = "php72";
    longDescription = ''
      增加一个dev-php环境的包
    '';
    homepage = "";
    changelog = "";
    platforms = platforms.Darwin;
  };
}
