
EAPI=5

inherit git-2 autotools

SLOT="0"
EGIT_REPO_URI="https://github.com/pabigot/embtextf.git"
RESTRICT="binchecks strip"

src_prepare() {
	cd "${S}"
	perl -pe 's/^(AM_INIT_AUTOMAKE.*)\-Werror (.*)/\1\2/g' -i configure.ac || die
	eautoreconf
}

src_configure() {
	# we should fix this ...
	unset LDFLAGS
	unset CFLAGS
	unset CXXFLAGS

	cd "${S}"
	./configure --host=msp430-elf --prefix=/usr/msp430-elf \
	    --enable-libc-setvbuf --enable-gcov \
	    --with-gnu-ld --enable-shared || exit 1
}