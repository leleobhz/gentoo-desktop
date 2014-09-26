

EAPI=5

inherit base

SLOT="0"
DESCRIPTION=""
SRC_URI="http://tracker.openchange.org/attachments/download/244/openchange-2.1-QUADRANT.tar.gz"

KEYWORDS="~amd64 ~ia64 ~x86"

RDEPEND=">=net-fs/samba-4"
DEPEND="${RDEPEND}"

S="${WORKDIR}/openchange-2.1-QUADRANT"

src_install() {
    emake DESTDIR="${D}" install
    cd "${D}"
    rm -r openchange AD usr/bin usr/sbin usr/share usr/modules usr/lib64/nagios
}
