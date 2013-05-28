EAPI=5
inherit eutils linux-mod linux-info

DESCRIPTION="A driver for Moxa UPort 1110/1130/1150/1150I"
HOMEPAGE="http://www.moxa.com/"
SRC_URI="http://mtsc.moxa.com:8888/software/ha/USB/UPort_1110_1130_1150/Linux/ver1.3.3/driv_linux_uport1p_v1.3.3_build_12091213.tgz"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="virtual/linux-sources"

S="${WORKDIR}/mxu11x0/driver"
MODULE_NAMES="mxu11x0(usb/serial)"
BUILD_TARGETS="module"
BUILD_PARAMS="KDIR=${KERNEL_DIR}"

src_prepare() {
    cd "${WORKDIR}"
    epatch "${FILESDIR}/mxu11x0-kernel-3.9.patch"
    convert_to_m "${S}/Makefile" || die "convert_to_m failed"
}

src_compile() {
    linux-mod_src_compile
}

src_install() {
    set_kvobj
    linux-mod_src_install
}