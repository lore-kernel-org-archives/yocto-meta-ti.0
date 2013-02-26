Return-Path: <m-karicheri2@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id CCE76E002AB
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 10:38:45 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1QIciux020056
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 12:38:44 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QIcib4014856
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 12:38:44 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 26 Feb 2013 12:38:43 -0600
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1QIch14015032;	Tue, 26 Feb 2013 12:38:43 -0600
Received: from a0868495 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <m-karicheri2@ti.com>)	id 1UAPQJ-0005To-DR;
	Tue, 26 Feb 2013 13:38:43 -0500
From: Murali Karicheri <m-karicheri2@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>, <cyril@ti.com>
Date: Tue, 26 Feb 2013 13:38:40 -0500
Message-ID: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] recipe: u-boot: update recipe for more images
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
X-List-Received-Date: Tue, 26 Feb 2013 18:38:46 -0000
Content-Type: text/plain

On Keystone EVM, u-boot build needs to create following additional
binaries and images
 - u-boot-spl.bin
	- This for first stage boot from SPI NOR flash
 - u-boot.img
	- This is the second stage u-boot image in uImage format.
 - u-boot-spi.gph
	- This combines the above two images into one image so that
	  it is easy to program on the device.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 SRC_URI and SRCREV will be replaced before pushing this recipe to repo.
 recipes-bsp/u-boot/u-boot_2013.01.bb |   64 ++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2013.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.bb
index b9e6daf..07e8d6e 100644
--- a/recipes-bsp/u-boot/u-boot_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot_2013.01.bb
@@ -10,14 +10,74 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PR = "r2+gitr${SRCPV}"
 
-SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+#SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
 
-SRCREV = "DEV.MCSDK-03.00.00.07"
+#SRCREV = "DEV.MCSDK-03.00.00.08"
+SRCREV = "327e9f591d6530650609915c7c35c874bfc25550"
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
 
 S = "${WORKDIR}/git"
 
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


