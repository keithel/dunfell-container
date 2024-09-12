SUMMARY = "helloworld"
DESCRIPTION = "A program that prints hello world"
LICENSE = "CLOSED"
SRC_URI = "file://hello.cpp"

DEPENDS += "gcc"
RDEPENDS_helloworld += "libstdc++"

do_compile() {
	${CXX} ${CXXFLAGS} ${LDFLAGS} -o ${WORKDIR}/helloworld ${WORKDIR}/hello.cpp
}

do_install() {
	install -d ${D}${base_bindir}
	install -m 0755 ${WORKDIR}/helloworld ${D}${base_bindir}
}

FILES_${PN} += "${base_bindir}/helloworld" 
