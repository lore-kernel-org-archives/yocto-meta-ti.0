Return-Path: <m-karicheri2@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 862C3E01439
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 14:24:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47LOLgb010101
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:24:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47LOL5w031011
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:24:21 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 16:24:20 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r47LOK6D027138;	Tue, 7 May 2013 16:24:20 -0500
Received: from a0868495 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <m-karicheri2@ti.com>)	id 1UZpMy-0001dL-LQ;
	Tue, 07 May 2013 17:24:20 -0400
From: Murali Karicheri <m-karicheri2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 May 2013 17:24:18 -0400
Message-ID: <1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
MIME-Version: 1.0
Subject: [RESEND: PATCH 2/3] keystone2: u-boot: update to add gph support
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
X-List-Received-Date: Tue, 07 May 2013 21:24:21 -0000
Content-Type: text/plain

This patch add support for
 1) switch between release and nightly builds
 2) support for building gph images

Also fixed the COMPATIBLE_MACHINE to keystone-evm

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   79 +++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index 788d813..bfe5111 100644
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -1,16 +1,85 @@
 require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
-COMPATIBLE_MACHINE = "keystone"
+COMPATIBLE_MACHINE = "keystone-evm"
 
-PR = "r2+gitr${SRCPV}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+PR = "r3+gitr${SRCPV}"
+
+# for nightly switch the two below
+#SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
 
-# DEV.MCSDK-03.00.00.07
-SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"
+# for nightly switch the two below
+#SRCREV = "DEV.MCSDK-2013-01.10"
+SRCREV = "${AUTOREV}"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
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
+do_configure () {
+	oe_runmake ${UBOOT_MACHINE}
+}
+
+do_compile () {
+	unset LDFLAGS
+	unset CFLAGS
+	unset CPPFLAGS
+	oe_runmake ${UBOOT_MAKE_TARGET}
+}
+
+do_install () {
+	install -d ${D}/boot
+	install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
+	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
+	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
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


