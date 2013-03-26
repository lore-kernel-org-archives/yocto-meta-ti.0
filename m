Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83EFBE014E5
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2C4E552A55; Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004227.2C4E552A55@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot.inc: refactor local include file to base off core with TI customizations
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: ceb0f4897c6d3fa64db8022fd91e70dfb562bd84
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ceb0f4897c6d3fa64db8022fd91e70dfb562bd84

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 17:40:59 2013 -0400

u-boot.inc: refactor local include file to base off core with TI customizations

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

 recipes-bsp/u-boot/u-boot-ti.inc |   17 +++++++++
 recipes-bsp/u-boot/u-boot.inc    |   68 --------------------------------------
 2 files changed, 17 insertions(+), 68 deletions(-)

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


