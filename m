Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F18FCE0076C
	for <meta-ti@yoctoproject.org>; Sun,  9 Feb 2014 19:46:15 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1A3kDei030426
	for <meta-ti@yoctoproject.org>; Sun, 9 Feb 2014 21:46:14 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1A3kDo7022129
	for <meta-ti@yoctoproject.org>; Sun, 9 Feb 2014 21:46:13 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 9 Feb 2014 21:46:13 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1A3kDAb018986;	Sun, 9 Feb 2014 21:46:13 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 9 Feb 2014 22:46:11 -0500
Message-ID: <1392003971-25146-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] u-boot-keystone: Update keystone u-boot to latest version
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
X-List-Received-Date: Mon, 10 Feb 2014 03:46:16 -0000
Content-Type: text/plain

- Update license and checksum
- Update source URL
- Added SPI Nor binaries and deployed images
- Update script to configure, compile, install, deploy

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from last patch
* Remove EXTRA_OEMAKE Line
* Removed do_configure & do_compile functions
* Convert do_install --> do_install_append
* Note: The do deploy functions couldnot be reduced because of
  copying to different directory compared to u-boot.inc
---
---
 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   59 +++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index 788d813..8040a88 100644
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -1,16 +1,67 @@
 require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
 COMPATIBLE_MACHINE = "keystone"
 
-PR = "r2+gitr${SRCPV}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+PR = "r3+gitr${SRCPV}"
+
+# for nightly switch the two below
+SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
 
-# DEV.MCSDK-03.00.00.07
-SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"
+#Tag "K2_UBOOT_2013-01_13.12"
+SRCREV = "e4b19a8d418e35bf2bd63eba485afd5d9e436188"
+
+S = "${WORKDIR}/git"
 
 UBOOT_SUFFIX = "bin"
+
+UBOOT_MAKE_TARGET = "u-boot-spi.gph"
+# SPI NOR Flash binaries
+UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
+UBOOT_SPI_BINARY = "u-boot.img"
+UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
+# SPI NOR Flash deployed images
+UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_SPI_SPL_SYMLINK = "u-boot-spl-${MACHINE}.bin"
+UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
+UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
+UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
+UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
+
+do_install_append () {
+	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
+	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
+	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
+	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
+}
+
+do_deploy () {
+	install -d ${DEPLOY_DIR_IMAGE}
+	install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
+	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_SPL_IMAGE}
+	install ${S}/${UBOOT_SPI_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_IMAGE}
+	install ${S}/${UBOOT_SPI_GPH_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_GPH_IMAGE}
+
+	cd ${DEPLOY_DIR_IMAGE}
+	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
+	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
+	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
+	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
+	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
+}
-- 
1.7.9.5


