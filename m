Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58B32E0049B; Mon, 19 Oct 2015 16:22:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC42AE0049B
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 16:22:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 876FC52999; Mon, 19 Oct 2015 23:22:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019232248.876FC52999@arago-project.org>
Date: Mon, 19 Oct 2015 23:22:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update to the lates, change Keystone build steps
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
X-List-Received-Date: Mon, 19 Oct 2015 23:22:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 7f77498b22cb513aa25d851270dc0371f0892fd7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7f77498b22cb513aa25d851270dc0371f0892fd7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Oct 20 04:18:51 2015 +0000

u-boot-ti-staging: update to the lates, change Keystone build steps

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb |   17 ++---------------
 1 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
index 93745ba..380f567 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
@@ -7,29 +7,26 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 
-PR = "r10"
+PR = "r11"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2015.07"
 
-SRCREV = "d49aa5effa20d0b943c74ced84e67defce6d6d1c"
+SRCREV = "75d995e87f47902b40065982ccbaae7a466d0913"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
 
 # Keystone specifics
 UBOOT_SUFFIX_keystone = "bin"
-UBOOT_MAKE_TARGET_keystone = "u-boot-spi.gph u-boot-nand.gph"
-SPL_BINARY_keystone = ""
 SPL_UART_BINARY_keystone = ""
 
 # SPI NOR Flash binaries
 UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
 UBOOT_SPI_BINARY = "u-boot.img"
 UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
-UBOOT_NAND_GPH_BINARY = "u-boot-nand.gph"
 
 # SPI NOR Flash deployed images
 UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
@@ -38,8 +35,6 @@ UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
 UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
 UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
-UBOOT_NAND_GPH_IMAGE = "u-boot-nand-${MACHINE}-${PV}-${PR}.gph"
-UBOOT_NAND_GPH_SYMLINK = "u-boot-nand-${MACHINE}.gph"
 
 do_install_append_keystone () {
 	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
@@ -50,9 +45,6 @@ do_install_append_keystone () {
 
 	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
 	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
-
-	install ${S}/${UBOOT_NAND_GPH_BINARY} ${D}/boot/${UBOOT_NAND_GPH_IMAGE}
-	ln -sf ${UBOOT_NAND_GPH_IMAGE} ${D}/boot/${UBOOT_NAND_GPH_BINARY}
 }
 
 do_deploy_append_keystone () {
@@ -70,9 +62,4 @@ do_deploy_append_keystone () {
 	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
 	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
 	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
-
-	install ${S}/${UBOOT_NAND_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_NAND_GPH_IMAGE}
-	rm -f ${UBOOT_NAND_GPH_BINARY} ${UBOOT_NAND_GPH_SYMLINK}
-	ln -sf ${UBOOT_NAND_GPH_IMAGE} ${UBOOT_NAND_GPH_SYMLINK}
-	ln -sf ${UBOOT_NAND_GPH_IMAGE} ${UBOOT_NAND_GPH_BINARY}
 }


