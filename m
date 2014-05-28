Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 273ADE00B6F; Wed, 28 May 2014 11:49:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C015DE00B6A
	for <meta-ti@yoctoproject.org>; Wed, 28 May 2014 11:49:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4SIn8X9019233
	for <meta-ti@yoctoproject.org>; Wed, 28 May 2014 13:49:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4SIn7h7019740
	for <meta-ti@yoctoproject.org>; Wed, 28 May 2014 13:49:08 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 28 May 2014 13:49:07 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4SIn7jo014263;
	Wed, 28 May 2014 13:49:07 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1WpiuR-0007Mt-A5; Wed, 28 May 2014 14:49:07 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 28 May 2014 14:49:05 -0400
Message-ID: <1401302945-28291-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] keystone: u-boot: add build support for EMIF16 NAND gph image
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
X-List-Received-Date: Wed, 28 May 2014 18:49:19 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

---
 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index 5e5eb51..37f7738 100644
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
 
 COMPATIBLE_MACHINE = "keystone"
 
-PR = "r4+gitr${SRCPV}"
+PR = "r5+gitr${SRCPV}"
 
 # Tag "K2_UBOOT_2013_01_14.05_16"
 SRCREV = "fee500417b989fc9906d86e377b4d3d96033d54e"
@@ -15,12 +15,13 @@ SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRAN
 S = "${WORKDIR}/git"
 
 UBOOT_SUFFIX = "bin"
-UBOOT_MAKE_TARGET = "u-boot-spi.gph"
+UBOOT_MAKE_TARGET = "u-boot-spi.gph u-boot-nand.gph"
 
 # SPI NOR Flash binaries
 UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
 UBOOT_SPI_BINARY = "u-boot.img"
 UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
+UBOOT_NAND_GPH_BINARY = "u-boot-nand.gph"
 
 # SPI NOR Flash deployed images
 UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
@@ -29,6 +30,8 @@ UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
 UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
 UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
+UBOOT_NAND_GPH_IMAGE = "u-boot-nand-${MACHINE}-${PV}-${PR}.gph"
+UBOOT_NAND_GPH_SYMLINK = "u-boot-nand-${MACHINE}.gph"
 
 do_install_append () {
 	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
@@ -39,6 +42,9 @@ do_install_append () {
 
 	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
 	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
+
+        install ${S}/${UBOOT_NAND_GPH_BINARY} ${D}/boot/${UBOOT_NAND_GPH_IMAGE}
+        ln -sf ${UBOOT_NAND_GPH_IMAGE} ${D}/boot/${UBOOT_NAND_GPH_BINARY}
 }
 
 do_deploy_append () {
@@ -56,4 +62,9 @@ do_deploy_append () {
 	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
 	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
 	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
+
+        install ${S}/${UBOOT_NAND_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_NAND_GPH_IMAGE}
+        rm -f ${UBOOT_NAND_GPH_BINARY} ${UBOOT_NAND_GPH_SYMLINK}
+        ln -sf ${UBOOT_NAND_GPH_IMAGE} ${UBOOT_NAND_GPH_SYMLINK}
+        ln -sf ${UBOOT_NAND_GPH_IMAGE} ${UBOOT_NAND_GPH_BINARY}
 }
-- 
1.7.9.5


