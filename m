Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 123D3E009B8; Thu,  2 Feb 2017 15:35:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	UPPERCASE_50_75 autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EDD0E00826
	for <meta-ti@yoctoproject.org>; Thu,  2 Feb 2017 15:35:28 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D957852B2E; Thu,  2 Feb 2017 23:35:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170202233526.D957852B2E@arago-project.org>
Date: Thu,  2 Feb 2017 23:35:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: move common settings and code to u-boot-ti.inc
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
X-List-Received-Date: Thu, 02 Feb 2017 23:35:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5021fec8b9799a805c9c3bdad30d34f99c97aeb8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5021fec8b9799a805c9c3bdad30d34f99c97aeb8

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb  2 04:04:06 2017 +0000

u-boot: move common settings and code to u-boot-ti.inc

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |  108 +-------------------
 recipes-bsp/u-boot/u-boot-ti.inc                |  126 ++++++++++++++++++++---
 2 files changed, 113 insertions(+), 121 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 4998d68..fa15569 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -1,113 +1,7 @@
 require u-boot-ti.inc
 
-# u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native"
-
-DESCRIPTION = "u-boot bootloader for TI devices"
-
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
-
 PR = "r30"
-PV_append = "+git${SRCPV}"
 
-SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "ti-u-boot-2016.05"
+BRANCH = "ti-u-boot-2016.05"
 
 SRCREV = "4db46a6bbde46e4587b77e14763787f66c292701"
-
-# Support for secure devices - detailed info is in doc/README.ti-secure
-TI_SECURE_DEV_PKG ?= ""
-export TI_SECURE_DEV_PKG
-
-SPL_BINARY = "MLO"
-SPL_BINARY_k2e-hs-evm = ""
-SPL_UART_BINARY = "u-boot-spl.bin"
-
-# Keystone specifics
-UBOOT_SUFFIX_keystone = "bin"
-SPL_UART_BINARY_keystone = ""
-
-# SPI NOR Flash binaries
-UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
-UBOOT_SPI_BINARY = "u-boot.img"
-UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
-
-# SPI NOR Flash deployed images
-UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_SPI_SPL_SYMLINK = "u-boot-spl-${MACHINE}.bin"
-UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
-UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
-UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
-
-# HS XLD
-UBOOT_HS_XLD_BINARY = "u-boot-spl_HS_X-LOADER"
-UBOOT_HS_XLD_IMAGE = "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
-UBOOT_HS_XLD_SYMLINK = "u-boot-spl_HS_X-LOADER-${MACHINE}"
-
-# HS MLO
-UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
-UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
-UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
-
-do_compile_append_am437x-hs-evm () {
-	if [ -f ${B}/u-boot-spl_HS_ISSW ]; then
-		rm -rf ${B}/MLO
-		cp ${B}/u-boot-spl_HS_ISSW ${B}/MLO
-	fi
-}
-
-do_install_append () {
-	if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
-		install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
-		ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
-	fi
-	if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
-		install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
-		ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
-	fi
-}
-
-do_deploy_append () {
-	if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
-		install ${B}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}
-		rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
-		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
-		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
-	fi
-	if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
-		install ${B}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}
-		rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
-		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
-		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
-	fi
-}
-
-do_install_append_keystone () {
-	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
-	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
-
-	install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
-	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
-
-	install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
-	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
-}
-
-do_deploy_append_keystone () {
-	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
-	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
-	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
-	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
-
-	install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
-	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
-	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
-	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
-
-	install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
-	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
-	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
-	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
-}
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 661f931..c53689e 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -16,8 +16,18 @@ require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
 
+SUMMARY = "u-boot bootloader for TI devices"
+
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+
+BRANCH ?= "master"
+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+
+PV_append = "+git${SRCPV}"
+
+# u-boot needs devtree compiler to parse dts files
+DEPENDS += "dtc-native"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,26 +38,114 @@ PKG_${PN}-dbg = "u-boot-dbg"
 
 S = "${WORKDIR}/git"
 
+# Support for secure devices - detailed info is in doc/README.ti-secure
+TI_SECURE_DEV_PKG ?= ""
+export TI_SECURE_DEV_PKG
+
 # SPL (Second Program Loader) to be loaded over UART
 SPL_UART_BINARY ?= ""
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
 
+SPL_BINARY = "MLO"
+SPL_BINARY_k2e-hs-evm = ""
+SPL_UART_BINARY = "u-boot-spl.bin"
+
+# Keystone specifics
+UBOOT_SUFFIX_keystone = "bin"
+SPL_UART_BINARY_keystone = ""
+
+# SPI NOR Flash binaries
+UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
+UBOOT_SPI_BINARY = "u-boot.img"
+UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
+
+# SPI NOR Flash deployed images
+UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_SPI_SPL_SYMLINK = "u-boot-spl-${MACHINE}.bin"
+UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
+UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
+UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
+UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
+
+# HS XLD
+UBOOT_HS_XLD_BINARY = "u-boot-spl_HS_X-LOADER"
+UBOOT_HS_XLD_IMAGE = "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_XLD_SYMLINK = "u-boot-spl_HS_X-LOADER-${MACHINE}"
+
+# HS MLO
+UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
+UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
+
+do_compile_append_am437x-hs-evm () {
+	if [ -f ${B}/u-boot-spl_HS_ISSW ]; then
+		rm -rf ${B}/MLO
+		cp ${B}/u-boot-spl_HS_ISSW ${B}/MLO
+	fi
+}
+
 do_install_append () {
-    if [ "x${SPL_UART_BINARY}" != "x" ]
-    then
-        install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
-        ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
-    fi
+	if [ "x${SPL_UART_BINARY}" != "x" ]; then
+		install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
+		ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
+	fi
+	if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
+		install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
+		ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
+	fi
+	if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
+		install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
+		ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
+	fi
 }
 
 do_deploy_append () {
-    cd ${DEPLOYDIR}
-    if [ "x${SPL_UART_BINARY}" != "x" ]
-    then
-        install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
-        rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
-        ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
-        ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
-    fi
+	cd ${DEPLOYDIR}
+	if [ "x${SPL_UART_BINARY}" != "x" ]; then
+		install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
+		rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+		ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
+		ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+	fi
+	if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
+		install ${B}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}
+		rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
+		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
+		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
+	fi
+	if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
+		install ${B}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}
+		rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
+		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
+		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
+	fi
+}
+
+do_install_append_keystone () {
+	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
+
+	install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
+	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
+
+	install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
+}
+
+do_deploy_append_keystone () {
+	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
+	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
+
+	install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
+	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
+	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
+	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
+
+	install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
+	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
 }


