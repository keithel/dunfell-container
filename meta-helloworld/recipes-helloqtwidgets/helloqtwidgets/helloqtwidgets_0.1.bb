SUMMARY = "helloqtwidgets"
DESCRIPTION = "A Qt app that shows a window with hello world label"
LICENSE = "CLOSED"

SRC_URI += "file://main.cpp"
SRC_URI += "file://mainwindow.cpp"
SRC_URI += "file://mainwindow.h"
SRC_URI += "file://mainwindow.ui"
SRC_URI += "file://CMakeLists.txt"

inherit cmake_qt5

DEPENDS += "qtbase fontconfig"
RDEPENDS_helloqtwidgets += "qtbase fontconfig ttf-bitstream-vera"

S="${WORKDIR}"

do_install() {
	install -d ${D}${base_bindir}
	install -m 0755 ${B}/hello_widgets ${D}${base_bindir}
}

FILES_${PN} += "${base_bindir}/hello_widgets"
