with import <nixpkgs> {}; stdenv.mkDerivation {
  name = "dev-jcleng-php71-linux-7.1.13";

  # Source Code
  # See: https://nixos.org/nixpkgs/manual/#ssec-unpack-phase
  # wget https://github.91chifun.workers.dev//https://github.com/php/php-src/archive/php-7.1.13.tar.gz
  src = ./src;
  # src = fetchurl {
  #    url = "https://github.com/php/php-src/archive/php-7.1.13.tar.gz";
  #    sha256 = "eaab3bed90f28e6232ee9bf5510b6533e5c1c8777542ad45db75a027cd2dbb85";
  # };
  # Dependencies
  # See: https://nixos.org/nixpkgs/manual/#ssec-stdenv-dependencies
  buildInputs = [ tree coreutils pkg-config re2c libwebp libzip xorg.libXpm bison zlib git libxml2 openssl autoconf automake libtool gcc10  pcre curl libpng libjpeg freetype gd libiconv];

  # Build Phases
  # See: https://nixos.org/nixpkgs/manual/#sec-stdenv-phases
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
--with-pdo-mysql \
--with-mysqli \
--with-mhash \
--with-openssl \
--with-gd=${gd.dev}/include \
--with-iconv-dir=${libiconv}/ \
--with-zlib=${zlib.dev} \
--with-libxml-dir=${libxml2.dev} \
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
  buildPhase = ''
    echo "编译:"
    make -j4
  '';
  installPhase = ''
    echo "安装:"
    make install
  '';
}
