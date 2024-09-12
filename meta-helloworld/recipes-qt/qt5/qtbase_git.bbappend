FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-handle-display-connected-ver7-ported-to-v5.15.16.patch \
    file://0002-Log-EGL_EXTENSIONS-when-failing-due-to-missing-requi.patch \
    "

PACKAGECONFIG += " gles2 kms"
PACKAGECONFIG += " fontconfig freetype"
QT_QPA_EGLFS_INTEGRATION ?= "eglfs_kms_egldevice"
