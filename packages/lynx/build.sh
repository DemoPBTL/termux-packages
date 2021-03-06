TERMUX_PKG_HOMEPAGE=http://lynx.isc.org/
TERMUX_PKG_DESCRIPTION="The text web browser"
TERMUX_PKG_VERSION=2.8.9dev.13
TERMUX_PKG_SRCURL=ftp://invisible-island.net/lynx/tarballs/lynx${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=c72e17b226c2397096eb4e736811634b83764e560fa99844b60d281da141541c
TERMUX_PKG_DEPENDS="ncurses, openssl, libbz2, libidn"
TERMUX_PKG_FOLDERNAME="lynx$TERMUX_PKG_VERSION"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-screen=ncursesw --enable-widec --enable-scrollbar --enable-nested-tables --enable-htmlized-cfg --with-ssl --with-zlib --with-bzlib --enable-cjk --enable-japanese-utf8 --enable-progressbar --enable-prettysrc --enable-forms-options --enable-8bit-toupper --enable-ascii-ctypes --disable-font-switch"

termux_step_pre_configure() {
	CC+=" $LDFLAGS"
	unset LDFLAGS
}

termux_step_make_install () {
	make uninstall
	make install
}
