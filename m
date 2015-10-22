Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98E5AE0049B; Thu, 22 Oct 2015 07:49:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AB4BE00343
	for <meta-ti@yoctoproject.org>; Thu, 22 Oct 2015 07:49:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9MEngSr008383
	for <meta-ti@yoctoproject.org>; Thu, 22 Oct 2015 09:49:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9MEnfWr027444
	for <meta-ti@yoctoproject.org>; Thu, 22 Oct 2015 09:49:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Oct 2015 09:49:42 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9MEnfVY004862;	Thu, 22 Oct 2015 09:49:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Oct 2015 10:49:39 -0400
Message-ID: <1445525379-19219-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] ti-ccsv6-native: Add CCS 6.1.1.00022
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
X-List-Received-Date: Thu, 22 Oct 2015 14:49:48 -0000
Content-Type: text/plain

* Due to licensing, this installer must be downloaded manually and
  placed into either the downloads directory, or placed on a mirror.
* Please see http://processors.wiki.ti.com/index.php/Download_CCS#Code_Composer_Studio_Version_6_Downloads

* NOTE: That the Linux off-line installation tarball is the file required.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Used correct HOMEPAGE
* Move ti-cgt-arm version to a variable
* changed "CCSV6_INSTALL_DIR*" variables to use all caps

 recipes-ti/devtools/ti-ccsv6-native_6.1.1.00022.bb | 42 ++++++++++++++++++++++
 recipes-ti/includes/ti-paths.inc                   |  4 +++
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-ccsv6-native_6.1.1.00022.bb

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.1.00022.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.1.00022.bb
new file mode 100644
index 0000000..c5a4f33
--- /dev/null
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.1.1.00022.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "TI DSP Code Generation Tools"
+HOMEPAGE = "http://processors.wiki.ti.com/index.php/Download_CCS#Code_Composer_Studio_Version_6_Downloads"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/ccsv6/doc/EULA/EULA.doc;md5=24fb8a52ac52d3938b5888362edb295a"
+
+inherit native
+
+require recipes-ti/includes/ti-unpack.inc
+require recipes-ti/includes/ti-staging.inc
+require recipes-ti/includes/ti-paths.inc
+
+TI_CGT_ARM_VERSION = "5.2.5"
+
+SRC_URI = "http://install.source.dir.local/CCS${PV}_linux.tar.gz;name=ccsv6"
+
+S = "${WORKDIR}/CCS${PV}_linux"
+
+BINFILE = "CCS${PV}_linux/ccs_setup_${PV}.bin"
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
+TI_BIN_UNPK_CMDS = ""
+
+SRC_URI[ccsv6.md5sum] = "648d5f41e8a7a93c16d51cd34045ba15"
+SRC_URI[ccsv6.sha256sum] = "b82958a125d5c6bea07cfc12a6f2a77c45e1560217c1aac02194b6e3408c5105"
+
+do_install() {
+    install -d ${D}${CCSV6_INSTALL_DIR_RECIPE}
+    cp -r ${WORKDIR}/ccsv6/. ${D}${CCSV6_INSTALL_DIR_RECIPE}
+
+    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
+    cp -r ${WORKDIR}/ccsv6/tools/compiler/ti-cgt-arm_${TI_CGT_ARM_VERSION}/. \
+          ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN} += "\
+  ${CCSV6_INSTALL_DIR_RECIPE} \
+  ${M4_TOOLCHAIN_INSTALL_DIR_RECIPE} \
+"
+
+INSANE_SKIP_${PN} = "arch libdir ldflags staticdev textrel dev-so"
+
+EXCLUDE_FROM_SHLIBS = "1"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index bd80fa1..d4bbe9e 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -45,6 +45,8 @@ export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
 export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
 export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
 export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
+export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
+export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
@@ -80,6 +82,8 @@ export XDAIS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${XDAIS_INSTALL_DIR_RECIPE
 export XDC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${XDC_INSTALL_DIR_RECIPE}"
 export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
 export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
+export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
+export CCSV6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
-- 
1.9.1


