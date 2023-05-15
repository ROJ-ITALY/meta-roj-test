DEPENDS_remove = "virtual/bootloader"

IMAGE_FSTYPES_remove = "wic.bmap wic.bz2"
IMAGE_FSTYPES_append = " tar.gz"

IMAGE_INSTALL_append = " kernel-modules pciutils"
