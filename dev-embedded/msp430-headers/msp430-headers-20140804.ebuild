EAPI="5"

inherit eutils versionator

RH_PV="2.01.01.00"

DESCRIPTION="MCU-specific data for MSP430 microcontrollers"
HOMEPAGE="http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/index_FDS.html"
SRC_URI="http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/$(replace_all_version_separators '_' $RH_PV )/exports/msp430-support-files.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_unpack() {
	mkdir "${S}" || die
	cd "${WORKDIR}" || die
	unpack ${A}
	mv "${WORKDIR}/include/" "${WORKDIR}/unpack/" || die

	mkdir "${S}/lib" || die
	mkdir "${S}/doc" || die
	mkdir "${S}/include" || die

	cd "${WORKDIR}/unpack/" || die
	mv *.ld "${S}/lib/" || die
	mv *.h "${S}/include/" || die
	mv * "${S}/doc/" || die
}

src_install() {
	insinto "/usr/msp430-elf" 
	doins -r "${S}/lib" "${S}/include"
	dodoc ${S}/doc/*
}
