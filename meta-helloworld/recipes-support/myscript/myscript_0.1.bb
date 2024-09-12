SUMMARY = "Script"
SRC_URI = " file://myscript"
LICENSE = "CLOSED"

do_install() {
    install -d ${D}${base_bindir}
    install -m 0755 ${WORKDIR}/myscript ${D}/${base_bindir}/
}

FILES_${PN} += "${base_bindir}/myscript"
