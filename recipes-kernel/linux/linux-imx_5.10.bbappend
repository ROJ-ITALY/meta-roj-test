# ROJ

DESCRIPTION = "kernel roj test"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-dts-smarc-som.patch \
    file://0002-dts-010100-010101-010102.patch \
    file://0003-dts-020100-020101-020102.patch \
    file://0004-i210-support.patch \
    file://logo_linux_clut224.ppm \
	file://igb.cfg \
	file://compile_test.cfg \
"

DELTA_KERNEL_DEFCONFIG_append = " igb.cfg compile_test.cfg"

# Add custom VDW LOGO
do_configure_prepend() {
    # Convert the logo to 224 colors pnmraw 
    # $ sudo apt-get install netpbm
    # $ pngtopnm logo.png | ppmquant 224 | pnmnoraw > logo_linux_clut224.ppm
    if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
        install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm ${S}/drivers/video/logo/logo_linux_clut224.ppm
    fi
}
