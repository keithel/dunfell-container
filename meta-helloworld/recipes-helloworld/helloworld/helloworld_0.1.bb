SUMMARY = "helloworld"
DESCRIPTION = "A program that prints hello world"
LICENSE = "CLOSED"

SRC_URI += "file://main.cpp"
SRC_URI += "file://CMakeLists.txt"


inherit cmake_qt5

DEPENDS += "qtbase"
RDEPENDS_helloworld += "qtbase"

S="${WORKDIR}"

do_install() {
	install -d ${D}${base_bindir}
	install -m 0755 ${B}/helloqtconsole ${D}${base_bindir}
}

FILES_${PN} += "${base_bindir}/helloqtconsole"
