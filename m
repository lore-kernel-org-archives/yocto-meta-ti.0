Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6BAEE00E07; Thu, 28 Apr 2016 12:00:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31843E00E01
	for <meta-ti@yoctoproject.org>; Thu, 28 Apr 2016 12:00:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 29EE352A85; Thu, 28 Apr 2016 19:00:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160428190039.29EE352A85@arago-project.org>
Date: Thu, 28 Apr 2016 19:00:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: add version 2016.05 (rc1)
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
X-List-Received-Date: Thu, 28 Apr 2016 19:00:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a7e4b9560aaa9476e86e507132cc8705a4026db6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a7e4b9560aaa9476e86e507132cc8705a4026db6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 28 21:39:04 2016 +0000

u-boot-ti-staging: add version 2016.05 (rc1)

Set UBOOT_LOCALVERSION by default similar to KERNEL_LOCALVERSION

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |   78 +++++++++++++++++++++++
 recipes-bsp/u-boot/u-boot-ti.inc                |   12 ++++
 2 files changed, 90 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
new file mode 100644
index 0000000..f061c8c
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -0,0 +1,78 @@
+require u-boot-ti.inc
+
+# u-boot needs devtree compiler to parse dts files
+DEPENDS += "dtc-native"
+
+DESCRIPTION = "u-boot bootloader for TI devices"
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+
+PR = "r0"
+PV_append = "+git${SRCPV}"
+
+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "ti-u-boot-2016.05"
+
+SRCREV = "70f44b8fc3dac08f44fba75f1dc25680be208fba"
+
+# Support for secure devices - detailed info is in doc/README.ti-secure
+TI_SECURE_DEV_PKG ?= ""
+TI_SECURE_DEV_PKG_dra7xx-hs-evm = "${TI_SECURE_DEV_PKG_DRA7}"
+TI_SECURE_DEV_PKG_am437x-hs-evm = "${TI_SECURE_DEV_PKG_AM4}"
+export TI_SECURE_DEV_PKG
+
+SPL_BINARY = "MLO"
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
+do_compile_append_am437x-hs-evm () {
+	if [ -f ${S}/u-boot-spl_HS_ISSW ]; then
+		rm -rf ${S}/MLO
+		cp ${S}/u-boot-spl_HS_ISSW ${S}/MLO
+	fi
+}
+
+do_install_append_keystone () {
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
+do_deploy_append_keystone () {
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
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 0cb53ea..b0054c9 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,3 +1,15 @@
+# UBOOT_LOCALVERSION can be set to add a tag to the end of the
+# U-boot version string.  such as the commit id
+def get_git_revision(p):
+    import subprocess
+
+    try:
+        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE).communicate()[0].rstrip()
+    except OSError:
+        return None
+
+UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
+
 UBOOT_SUFFIX ?= "img"
 
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc


