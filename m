Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D47AE00B68; Thu, 29 May 2014 12:13:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 821F8E00A2F
	for <meta-ti@yoctoproject.org>; Thu, 29 May 2014 12:13:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B25C852A23; Thu, 29 May 2014 19:13:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140529191319.B25C852A23@arago-project.org>
Date: Thu, 29 May 2014 19:13:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Hao Zhang : keystone: u-boot: add build support for EMIF16 NAND gph image
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
X-List-Received-Date: Thu, 29 May 2014 19:13:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9277a0276f0c3a49793e53e57678455272042480
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9277a0276f0c3a49793e53e57678455272042480

Author: Hao Zhang <hzhang@ti.com>
Date:   Thu May 29 00:49:05 2014 +0000

keystone: u-boot: add build support for EMIF16 NAND gph image

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

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


