Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15262.1588624940864721847
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2020 13:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B64CF40C26;
	Mon,  4 May 2020 20:42:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcuzc_2Jjc7t; Mon,  4 May 2020 20:42:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7617540B3E;
	Mon,  4 May 2020 20:42:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A707616EC83;
	Mon,  4 May 2020 16:42:17 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] conf,recipes-bsp: support building for K3 R5F cores via multiconfig
Date: Mon,  4 May 2020 16:41:56 -0400
Message-Id: <1588624916-32174-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

K3 Multicore SoC architecture defines different functional domains, each
containing specific processing cores and peripherals. Early boot is normally
handled by running bootloader and loading SYSFW on MCU Cortex-R5F core:
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am65x/README
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/j721e/README

This change adds support for building bootloader and SYSFW ITB image for
K3 Cortex-R5F cores via multiconfig.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm-k3r5-sr2.conf      | 11 ++++
 conf/machine/am65xx-evm-k3r5.conf          | 12 ++++
 conf/machine/am65xx-evm.conf               |  6 ++
 conf/machine/am65xx-hs-evm-k3r5.conf       | 13 +++++
 conf/machine/am65xx-hs-evm.conf            | 20 ++++++-
 conf/machine/include/k3.inc                | 13 +++--
 conf/machine/include/k3r5.inc              | 23 ++++++++
 conf/machine/j7-evm-k3r5.conf              | 11 ++++
 conf/machine/j7-hs-evm-k3r5.conf           | 13 +++++
 conf/multiconfig/k3r5-sr2.conf             |  3 +
 conf/multiconfig/k3r5.conf                 |  5 ++
 recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb | 94 ++++++++++++++++++++++++++++++
 recipes-bsp/u-boot/u-boot-ti.inc           |  1 +
 13 files changed, 219 insertions(+), 6 deletions(-)
 create mode 100644 conf/machine/am65xx-evm-k3r5-sr2.conf
 create mode 100644 conf/machine/am65xx-evm-k3r5.conf
 create mode 100644 conf/machine/am65xx-hs-evm-k3r5.conf
 create mode 100644 conf/machine/include/k3r5.inc
 create mode 100644 conf/machine/j7-evm-k3r5.conf
 create mode 100644 conf/machine/j7-hs-evm-k3r5.conf
 create mode 100644 conf/multiconfig/k3r5-sr2.conf
 create mode 100644 conf/multiconfig/k3r5.conf
 create mode 100644 recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb

diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf b/conf/machine/am65xx-evm-k3r5-sr2.conf
new file mode 100644
index 0000000..c0b3cd5
--- /dev/null
+++ b/conf/machine/am65xx-evm-k3r5-sr2.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM65xx SR2.0 EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM65xx SR2.0 EVM (R5F core)
+
+# Booting SR2 requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/am65xx-evm-k3r5.conf
+SOC_FAMILY_append = ":k3r5-sr2"
+
+SYSFW_SOC = "am65x_sr2"
+SYSFW_SYMLINK = "sysfw.itb"
diff --git a/conf/machine/am65xx-evm-k3r5.conf b/conf/machine/am65xx-evm-k3r5.conf
new file mode 100644
index 0000000..bd17474
--- /dev/null
+++ b/conf/machine/am65xx-evm-k3r5.conf
@@ -0,0 +1,12 @@
+#@TYPE: Machine
+#@NAME: AM65xx EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM65xx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am65x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+SYSFW_SYMLINK = ""
+
+UBOOT_MACHINE = "am65x_evm_r5_defconfig"
diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 3edbb29..62fa360 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/am65xx.inc
 
+BBMULTICONFIG += "k3r5-sr2"
+
 MACHINE_FEATURES += "touchscreen"
 
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
@@ -23,3 +25,7 @@ UBOOT_MACHINE = "am65x_evm_a53_defconfig"
 OPTEEMACHINE = "k3"
 OPTEEFLAVOR = "am65x"
 OPTEEOUTPUTMACHINE = "k3"
+
+IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
+do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
diff --git a/conf/machine/am65xx-hs-evm-k3r5.conf b/conf/machine/am65xx-hs-evm-k3r5.conf
new file mode 100644
index 0000000..2b06f2c
--- /dev/null
+++ b/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: AM65xx HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am65x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index f989750..6d20a0d 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -2,10 +2,28 @@
 #@NAME: AM65xx HS EVM
 #@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM
 
-require conf/machine/am65xx-evm.conf
+require conf/machine/include/am65xx.inc
+
+MACHINE_FEATURES += "touchscreen"
+
+SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
+    ti/k3-am654-evm-hdmi.dtbo ti/k3-am654-idk.dtbo \
+    ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
+    ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
+    ti/k3-am654-base-board-jailhouse.dtbo \
+    ti/k3-am654-evm-prupwm.dtbo \
+"
 
 UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
 
+OPTEEMACHINE = "k3"
+OPTEEFLAVOR = "am65x"
+OPTEEOUTPUTMACHINE = "k3"
+
 UBOOT_ENTRYPOINT =       "0x80080000"
 UBOOT_LOADADDRESS =      "0x80080000"
 UBOOT_RD_LOADADDRESS =   "0x84000000"
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 5e67f5f..0c16d96 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -1,8 +1,12 @@
+# TI K3 Aarch64 profile for Cortex-A53/A72 cores
+
 require conf/machine/include/ti-soc.inc
 SOC_FAMILY_append = ":k3"
 
 require conf/machine/include/arm/arch-arm64.inc
 
+BBMULTICONFIG += "k3r5"
+
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r0"
 
@@ -34,9 +38,8 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 
-# Please note that booting K3 platform also requires
-# tiboot3.bin and sysfw.itb, which are provided by meta-arago
-# u-boot-k3-r5 and ti-sci-fw recipes
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
 WKS_FILE ?= "sdimage-3part.wks"
-do_image_wic[depends] += "u-boot:do_deploy"
+do_image_wic[depends] += "virtual/bootloader:do_deploy"
+do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc
new file mode 100644
index 0000000..52fcf38
--- /dev/null
+++ b/conf/machine/include/k3r5.inc
@@ -0,0 +1,23 @@
+# TI K3 Armv7 profile for Cortex-R5F cores
+
+require conf/machine/include/ti-soc.inc
+SOC_FAMILY_append = ":k3r5"
+
+# The closest of existing tunes for Cortex-R5F
+DEFAULTTUNE = "armv7athf"
+require conf/machine/include/tune-cortexa8.inc
+
+# R5 runs early bootloader and loads SYSFW
+# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am65x/README
+# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/j721e/README
+PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
+
+SPL_BINARY = ""
+UBOOT_SUFFIX = "bin"
+UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
+PACKAGECONFIG_pn-u-boot-ti-staging = ""
diff --git a/conf/machine/j7-evm-k3r5.conf b/conf/machine/j7-evm-k3r5.conf
new file mode 100644
index 0000000..b9e8cc0
--- /dev/null
+++ b/conf/machine/j7-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J7 EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J7 EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j721e"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE = "j721e_evm_r5_defconfig"
diff --git a/conf/machine/j7-hs-evm-k3r5.conf b/conf/machine/j7-hs-evm-k3r5.conf
new file mode 100644
index 0000000..53a7016
--- /dev/null
+++ b/conf/machine/j7-hs-evm-k3r5.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: J7 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J7 HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j721e"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE = "j721e_hs_evm_r5_defconfig"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/multiconfig/k3r5-sr2.conf b/conf/multiconfig/k3r5-sr2.conf
new file mode 100644
index 0000000..1708214
--- /dev/null
+++ b/conf/multiconfig/k3r5-sr2.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE_append = "-sr2"
diff --git a/conf/multiconfig/k3r5.conf b/conf/multiconfig/k3r5.conf
new file mode 100644
index 0000000..8c8f0c3
--- /dev/null
+++ b/conf/multiconfig/k3r5.conf
@@ -0,0 +1,5 @@
+MAINMACHINE := "${MACHINE}"
+
+DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
+
+MACHINE_append = "-k3r5"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
new file mode 100644
index 0000000..b17147a
--- /dev/null
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
@@ -0,0 +1,94 @@
+SUMMARY = "TI SCI firmware (SYSFW)"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
+
+CLEANBROKEN = "1"
+PR = "r0"
+
+# Loaded by R5F core
+COMPATIBLE_MACHINE = "k3r5"
+COMPATIBLE_MACHINE_aarch64 = "null"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+TI_SECURE_DEV_PKG ?= ""
+export TI_SECURE_DEV_PKG
+
+SRCREV = "6b02b1ea07da65a68444e86439ad5b031e9fd5a2"
+BRANCH ?= "ti-linux-firmware"
+SRCREV_imggen = "79f3807e0b169f2029dec9f3a679c231f4deb625"
+SRCREV_FORMAT = "imggen"
+
+SRC_URI = " \
+	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
+	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
+"
+
+S = "${WORKDIR}/git"
+
+SYSFW_SOC ?= "unknown"
+SYSFW_CONFIG ?= "unknown"
+
+SYSFW_PREFIX = "ti-sci-firmware"
+SYSFW_SUFFIX ?= "unknown"
+
+SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
+
+SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}*.bin"
+
+SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_SYMLINK ?= "sysfw.itb"
+
+CFLAGS[unexport] = "1"
+LDFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+do_configure[noexec] = "1"
+
+EXTRA_OEMAKE = "\
+    CROSS_COMPILE=${TARGET_PREFIX} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
+    SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
+"
+EXTRA_OEMAKE_HS = " \
+    HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
+"
+EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
+
+do_compile() {
+	cd ${WORKDIR}/imggen/
+	oe_runmake
+}
+
+do_install() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_VBINARY}
+	ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_IMAGE}
+	if [ ! -z "${SYSFW_SYMLINK}" ]; then
+		ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_SYMLINK}
+	fi
+}
+
+FILES_${PN} = "/boot"
+
+inherit deploy
+
+do_deploy () {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_VBINARY}
+	rm -f ${DEPLOYDIR}/${SYSFW_IMAGE}
+	ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
+	if [ ! -z "${SYSFW_SYMLINK}" ]; then
+		rm -f ${DEPLOYDIR}/${SYSFW_SYMLINK}
+		ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_SYMLINK}
+	fi
+
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
+addtask deploy before do_build after do_compile
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 04ff559..8f8f0af 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -57,6 +57,7 @@ export TI_SECURE_DEV_PKG
 SPL_UART_BINARY = "u-boot-spl.bin"
 SPL_UART_BINARY_keystone = ""
 SPL_UART_BINARY_k3 = ""
+SPL_UART_BINARY_k3r5 = ""
 SPL_UART_BINARY_lego-ev3 = ""
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
-- 
2.7.4

