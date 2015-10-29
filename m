Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A02A7E0059B; Thu, 29 Oct 2015 12:40:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A397E0059B
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 12:40:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 777F152961; Thu, 29 Oct 2015 19:40:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151029194042.777F152961@arago-project.org>
Date: Thu, 29 Oct 2015 19:40:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-cgt-pru: Add version 2.1.1
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
X-List-Received-Date: Thu, 29 Oct 2015 19:40:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: fada5c47e6304f8dc0245e53ae51fb4b5bf7112c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fada5c47e6304f8dc0245e53ae51fb4b5bf7112c

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Oct 29 22:09:48 2015 +0000

ti-cgt-pru: Add version 2.1.1

* TI PRU Code Generation Tools

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-cgt-pru_2.1.1.bb |   45 +++++++++++++++++++++++++++++++
 recipes-ti/includes/ti-paths.inc        |    3 ++
 2 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb b/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
new file mode 100644
index 0000000..3cffd24
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "TI PRU Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
+
+LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-unpack.inc
+
+BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
+BINFILE_NAME = "cgt-pru-x86"
+TI_BIN_UNPK_ARGS = "--prefix ${S}"
+TI_BIN_UNPK_CMDS = ""
+
+BINFILE_class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
+BINFILE_NAME_class-target = "cgt-pru-arm"
+
+SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
+
+SRC_URI[cgt-pru-x86.md5sum] = "d9923acea12dc41fc975c381804bd5ed"
+SRC_URI[cgt-pru-x86.sha256sum] = "bbea68a6e793156cfb4874777bfd41a32b20172d3a8f61db6aed33a697a58e30"
+
+SRC_URI[cgt-pru-arm.md5sum] = "3b97df4966715bdb50f9a9fc58fe6b24"
+SRC_URI[cgt-pru-arm.sha256sum] = "819a4680296fabf1ae0d4e0184276f8ab5324621d35388026d1b678ea71040c9"
+
+do_install() {
+    install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
+    cp -r ${S}/ti-cgt-pru_${PV}/. \
+          ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
+}
+
+do_install_class-target() {
+    ${WORKDIR}/${BINFILE} --prefix ${D}
+}
+
+FILES_${PN} += "${datadir}/ti/*"
+
+FILES_${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
+                   ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
+"
+
+INSANE_SKIP_${PN} += "arch staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 8880591..ad4ff78 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -48,6 +48,8 @@ export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
 export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
 export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
+export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
+
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
@@ -86,6 +88,7 @@ export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}
 export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
 export CCSV6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
 export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
+export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"


