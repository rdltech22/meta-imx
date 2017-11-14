FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
# Enable pango lib
PACKAGECONFIG_append = " pango "

# ion allocator will be enabled only when detecting the ion.h exists, which is built out from kernel.
# For now, ion allocatior is supported on mx7ulp & mx8
DEPENDS_append_mx7ulp = " virtual/kernel"
DEPENDS_append_mx8 = " virtual/kernel"

# Remove gio-unix-2.0 as it does not seem to exist anywhere
PACKAGECONFIG_remove = "gio-unix-2.0"
# Overwrite the unrecognised option which is set in gstreamer1.0-plugins-base.inc under poky layer
PACKAGECONFIG[gio-unix-2.0] = ""

# Use i.MX fork of GST for customizations
SRC_URI_remove_imx = " \
    http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
"

GST1.0-PLUGINS-BASE_SRC ?= "gitsm://source.codeaurora.org/external/imx/gst-plugins-base.git;protocol=https"
SRCBRANCH = "imx-1.12.x"

SRC_URI_append_imx = " \
    ${GST1.0-PLUGINS-BASE_SRC};branch=${SRCBRANCH} \
"
SRCREV_imx = "${AUTOREV}"

EXTRA_AUTORECONF = ""

S_imx = "${WORKDIR}/git"
