Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5488E01481
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:44 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV00DD8QRWRRG0@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AA6ED2038E; Mon,
	18 Mar 2013 19:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:12 -0400
Message-id: <1363649547-4693-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 04/19] u-boot.inc: refactor local include file to base off core with TI customizations
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
X-List-Received-Date: Mon, 18 Mar 2013 23:33:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Introduce own namespace to allow multiple instances of the same base version,
  possibly pulled from different trees or patched/customized for specific SoC.
* Suffix-less variant u-boot_YYYY.MM.bb is reserved for mainline versions of the
  recipe with no or minimal patches, with broader machine selection.
* Recipes for machine- or SoC-specific trees should use corresponding suffix -
  either machine, SoC or the name of the tree.
* The .inc file lets the suffixed recipes to provide virtual/bootloader, u-boot,
  as well as generate conventional u-boot binary packages for direct run-time
  dependencies.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 17 ++++++++++
 recipes-bsp/u-boot/u-boot.inc    | 68 ----------------------------------------
 2 files changed, 17 insertions(+), 68 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot-ti.inc
 delete mode 100644 recipes-bsp/u-boot/u-boot.inc

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
new file mode 100644
index 0000000..968f3e4
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -0,0 +1,17 @@
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PROVIDES += "u-boot"
+PKG_${PN} = "u-boot"
+PKG_${PN}-dev = "u-boot-dev"
+PKG_${PN}-dbg = "u-boot-dbg"
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "img"
diff --git a/recipes-bsp/u-boot/u-boot.inc b/recipes-bsp/u-boot/u-boot.inc
deleted file mode 100644
index 720f995..0000000
--- a/recipes-bsp/u-boot/u-boot.inc
+++ /dev/null
@@ -1,68 +0,0 @@
-DESCRIPTION = "U-Boot - the Universal Boot Loader"
-HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
-SECTION = "bootloaders"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
-
-PROVIDES = "virtual/bootloader"
-
-DEPENDS = "mtd-utils"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-PARALLEL_MAKE=""
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
-
-UBOOT_MACHINE ?= "${MACHINE}_config"
-UBOOT_BINARY ?= "u-boot.bin"
-UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
-UBOOT_MAKE_TARGET ?= "all"
-
-do_configure () {
-	oe_runmake ${UBOOT_MACHINE}
-}
-
-do_compile () {
-	unset LDFLAGS
-	unset CFLAGS
-	unset CPPFLAGS
-	oe_runmake ${UBOOT_MAKE_TARGET}
-}
-
-do_install () {
-	install -d ${D}/boot
-	install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-
-	if [ -e ${WORKDIR}/fw_env.config ] ; then
-		install -d ${D}${sysconfdir}
-		install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
-	fi
-
-}
-
-FILES_${PN} = "/boot ${sysconfdir}"
-# no gnu_hash in uboot.bin, by design, so skip QA
-INSANE_SKIP_${PN} = "1"
-
-inherit deploy
-
-addtask deploy before do_package after do_compile
-
-do_deploy () {
-	install -d ${DEPLOY_DIR_IMAGE}
-	install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
-
-	cd ${DEPLOY_DIR_IMAGE}
-	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
-
-	if [ -e ${S}/MLO ] ; then
-		install ${S}/MLO ${DEPLOY_DIR_IMAGE}/MLO-${MACHINE}-${PV}
-		rm -f ${DEPLOY_DIR_IMAGE}/MLO-${MACHINE} ${DEPLOY_DIR_IMAGE}/MLO
-		ln -sf MLO-${MACHINE}-${PV} ${DEPLOY_DIR_IMAGE}/MLO-${MACHINE}
-		ln -sf MLO-${MACHINE}-${PV} ${DEPLOY_DIR_IMAGE}/MLO
-	fi
-}
-- 
1.8.1.5


