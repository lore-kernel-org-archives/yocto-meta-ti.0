Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D90E6E00C1E; Tue, 26 Jan 2016 13:17:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D046E00BFE
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 13:16:59 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0QLGwmk024605
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:16:58 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLGw4A001395
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:16:58 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 15:16:58 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0QLGvUM012813;	Tue, 26 Jan 2016 15:16:58 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Jan 2016 16:16:40 -0500
Message-ID: <1453843011-28530-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
References: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] ti-cg-xml: Add version 2.41.00
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
X-List-Received-Date: Tue, 26 Jan 2016 21:17:02 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cg-xml_2.41.00.bb | 36 ++++++++++++++++++++++++++++++++
 recipes-ti/includes/ti-paths.inc         |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-cg-xml_2.41.00.bb

diff --git a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
new file mode 100644
index 0000000..115254e
--- /dev/null
+++ b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "TI CG_XML"
+HOMEPAGE = "http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/index.htm"
+SECTION = "devel"
+LICENSE = "BSD"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+require recipes-ti/includes/ti-unpack.inc
+
+PV = "2_41_00"
+
+S = "${WORKDIR}/cg_xml_${PV}"
+
+SRC_URI = "\
+    http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/cg_xml_v${PV}/cg_xml-v${PV}-Linux-x86-Install;name=cgxmlbin_linux \
+"
+
+LIC_FILES_CHKSUM = "file://cg_xml_${PV}_Manifest.pdf;md5=ba23d76ef3d5ec111b03267105c91bd4"
+
+SRC_URI[cgxmlbin_linux.md5sum] = "9e421f25f6da455b0155570ce0e62628"
+SRC_URI[cgxmlbin_linux.sha256sum] = "bbc25f4abe27a8b93bae1d8581c3dee87111c3769c305d086287038ee9038cbf"
+
+BINFILE="cg_xml-v${PV}-Linux-x86-Install"
+TI_BIN_UNPK_CMDS=""
+TI_BIN_UNPK_ARGS="--prefix ${S} --mode silent"
+
+do_install() {
+    install -d ${D}${CG_XML_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${CG_XML_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN} += "${CG_XML_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN} = "arch ldflags"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 2f253a0..4bff921 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -52,6 +52,7 @@ export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
 export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
 export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
 export IMGLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-imglib-c66x-tree"
+export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
 
 
 # This is where the tools will end up in sysroot
@@ -95,6 +96,7 @@ export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_
 export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
 export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
 export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
+export CG_XML_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
-- 
1.9.1


