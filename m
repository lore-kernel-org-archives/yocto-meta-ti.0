Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F7B4E00E0C; Thu, 28 Apr 2016 12:00:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D7B1E00E11
	for <meta-ti@yoctoproject.org>; Thu, 28 Apr 2016 12:00:41 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6318B52A94; Thu, 28 Apr 2016 19:00:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160428190039.6318B52A94@arago-project.org>
Date: Thu, 28 Apr 2016 19:00:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: remove outdated versions
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Apr 2016 19:00:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 398fb120076ab5b3afc9978f80f18dfc2f459331
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=398fb120076ab5b3afc9978f80f18dfc2f459331

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 28 20:14:09 2016 +0000

u-boot: remove outdated versions

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb      |   20 ------
 recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb      |   17 -----
 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb      |   71 --------------------
 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |   16 -----
 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb    |   18 -----
 recipes-bsp/u-boot/u-boot_2014.07.bb               |   25 -------
 6 files changed, 0 insertions(+), 167 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
deleted file mode 100644
index 8f805bc..0000000
--- a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require u-boot-ti.inc
-
-DESCRIPTION = "u-boot bootloader for ARM MPU devices"
-
-COMPATIBLE_MACHINE = "ti33x"
-
-DEFAULT_PREFERENCE = "-1"
-
-PR = "r6"
-PV_append = "+git${SRCPV}"
-
-SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
-
-# This version of u-boot is meant for 3.2 kernel which doesn't support device tree.
-BRANCH = "ti-u-boot-2013.01.01-amsdk-06.00.00.00"
-
-SRCREV = "540aa6fbb0c9274bda598f7e8819ed28259cad6b"
-
-# Set the name of the SPL that will built so that it is also packaged with u-boot.
-SPL_BINARY = "MLO"
diff --git a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
deleted file mode 100644
index 3a22864..0000000
--- a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require u-boot-ti.inc
-
-DESCRIPTION = "u-boot bootloader for TI devices supported by the GLSDK product"
-
-PR = "r1"
-PV_append = "+git${SRCPV}"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "git://git.omapzoom.org/repo/u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "p-ti-u-boot-2013.04"
-
-SRCREV = "76447484441a4b8e00840a2bde74e66dbac9e631"
-
-SPL_BINARY = "MLO"
-SPL_UART_BINARY = "u-boot-spl.bin"
diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
deleted file mode 100644
index e4387fc..0000000
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-require u-boot-ti.inc
-
-DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
-
-COMPATIBLE_MACHINE = "keystone"
-
-PR = "r6"
-PV_append = "+git${SRCPV}"
-
-# Tag "K2_UBOOT_2013_01_15.07_01"
-SRCREV = "5eaedcc4c2bca0ed971ee46694df7edc0cfa36cf"
-BRANCH = "master"
-
-SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "bin"
-UBOOT_MAKE_TARGET = "u-boot-spi.gph u-boot-nand.gph"
-
-# SPI NOR Flash binaries
-UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
-UBOOT_SPI_BINARY = "u-boot.img"
-UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
-UBOOT_NAND_GPH_BINARY = "u-boot-nand.gph"
-
-# SPI NOR Flash deployed images
-UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_SPI_SPL_SYMLINK = "u-boot-spl-${MACHINE}.bin"
-UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
-UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
-UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
-UBOOT_NAND_GPH_IMAGE = "u-boot-nand-${MACHINE}-${PV}-${PR}.gph"
-UBOOT_NAND_GPH_SYMLINK = "u-boot-nand-${MACHINE}.gph"
-
-do_install_append () {
-	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
-	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
-
-	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
-	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
-
-	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
-	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
-
-        install ${S}/${UBOOT_NAND_GPH_BINARY} ${D}/boot/${UBOOT_NAND_GPH_IMAGE}
-        ln -sf ${UBOOT_NAND_GPH_IMAGE} ${D}/boot/${UBOOT_NAND_GPH_BINARY}
-}
-
-do_deploy_append () {
-	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
-	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
-	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
-	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
-
-	install ${S}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
-	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
-	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
-	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
-
-	install ${S}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
-	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
-	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
-	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
-
-        install ${S}/${UBOOT_NAND_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_NAND_GPH_IMAGE}
-        rm -f ${UBOOT_NAND_GPH_BINARY} ${UBOOT_NAND_GPH_SYMLINK}
-        ln -sf ${UBOOT_NAND_GPH_IMAGE} ${UBOOT_NAND_GPH_SYMLINK}
-        ln -sf ${UBOOT_NAND_GPH_IMAGE} ${UBOOT_NAND_GPH_BINARY}
-}
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
deleted file mode 100644
index 821e9ed..0000000
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require u-boot-ti.inc
-
-DESCRIPTION = "u-boot bootloader for TI devices"
-
-PR = "r5"
-PV_append = "+git${SRCPV}"
-
-SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "ti-u-boot-2013.01.01"
-
-# This commit corresponds to ti2013.04.00 release tag
-SRCREV = "7552b4c906b0a50fbc5225dc43ed0192618e9d5d"
-
-SPL_BINARY = "MLO"
-SPL_UART_BINARY = "u-boot-spl.bin"
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
deleted file mode 100644
index de44faa..0000000
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require u-boot-ti.inc
-
-DESCRIPTION = "u-boot bootloader for TI devices"
-
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
-
-PR = "r8"
-PV_append = "+git${SRCPV}"
-
-SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "ti-u-boot-2013.10"
-
-# Corresponds to tag ti2013.12.01_amsdk-07.01
-SRCREV = "259ff9a577cc66cb40e3cdff3e41628e466f0fef"
-
-SPL_BINARY = "MLO"
-SPL_UART_BINARY = "u-boot-spl.bin"
diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
deleted file mode 100644
index 6cd8acd..0000000
--- a/recipes-bsp/u-boot/u-boot_2014.07.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require u-boot-ti.inc
-
-# DEPEND on dtc-native for mainline u-boot because the mainline u-boot depends
-# on some of the latest syntax constructs for an appended in dtb used for
-# items like secure boot/image signing.
-DEPENDS += "dtc-native"
-
-DESCRIPTION = "Mainline u-boot bootloader"
-
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
-
-SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "master"
-
-# Corresponds to tag v2014.07
-SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
-
-SPL_BINARY = "MLO"
-SPL_UART_BINARY = "u-boot-spl.bin"
-
-SPL_BINARY_omapl138 = ""
-SPL_UART_BINARY_omapl138 = ""


