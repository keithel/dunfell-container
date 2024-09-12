SUMMARY = "helloworld"
DESCRIPTION = "A program that prints hello world"
LICENSE = "CLOSED"
SRC_URI += "file://CMakeLists.txt"
SRC_URI += "file://hello.cpp"

DEPENDS += "gcc"
RDEPENDS_helloworld += "libstdc++"

inherit cmake

S="${WORKDIR}"

#do_compile() {
#    cp ../CMakeLists.txt .
#    cp ../hello.cpp .
#    cmake -G Ninja
#    cmake --build .
#	${CXX} ${CXXFLAGS} ${LDFLAGS} -o ${WORKDIR}/helloworld ${WORKDIR}/hello.cpp
#}

do_install() {
	install -d ${D}${base_bindir}
	install -m 0755 ${B}/helloworld ${D}${base_bindir}
}

FILES_${PN} += "${base_bindir}/helloworld" 
