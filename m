Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25785E00B45; Fri,  9 May 2014 11:06:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27E29E009D1
	for <meta-ti@yoctoproject.org>; Fri,  9 May 2014 11:06:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A715352AB1; Fri,  9 May 2014 17:57:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140509175752.A715352AB1@arago-project.org>
Date: Fri,  9 May 2014 17:57:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-keystone: update to the latest version
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
X-List-Received-Date: Fri, 09 May 2014 18:06:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 6cdd462232d5dc7cbbcfc21f34be329e6ae0c783
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6cdd462232d5dc7cbbcfc21f34be329e6ae0c783

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri May  9 09:55:44 2014 +0000

u-boot-keystone: update to the latest version

Modified version of the original patch from Sam Nelson

* Update source URL/REV
* Added SPI NOR binaries and deployed images

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   53 ++++++++++++++++++++++--
 1 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index 788d813..6717e62 100644
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -4,13 +4,56 @@ DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
 
 COMPATIBLE_MACHINE = "keystone"
 
-PR = "r2+gitr${SRCPV}"
-
-SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+PR = "r3+gitr${SRCPV}"
 
+# Tag "K2_UBOOT_2013_01_14.03_02"
+SRCREV = "0b9b4be2f3097b5bdc3b0ea7aa5e8f465097e365"
 BRANCH = "master"
 
-# DEV.MCSDK-03.00.00.07
-SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"
+SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
 
 UBOOT_SUFFIX = "bin"
+UBOOT_MAKE_TARGET = "u-boot-spi.gph"
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
+do_install_append () {
+	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
+
+	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
+	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
+
+	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
+}
+
+do_deploy_append () {
+	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
+	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
+
+	install ${S}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
+	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
+	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
+	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
+
+	install ${S}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
+	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
+}


