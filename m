Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0C1DE00BFF; Thu, 21 Jul 2016 07:47:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 996AAE00978
	for <meta-ti@yoctoproject.org>; Thu, 21 Jul 2016 07:47:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6LElRdF013586
	for <meta-ti@yoctoproject.org>; Thu, 21 Jul 2016 09:47:27 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6LElRkw030511
	for <meta-ti@yoctoproject.org>; Thu, 21 Jul 2016 09:47:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 21 Jul 2016 09:47:27 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6LElP62017392;	Thu, 21 Jul 2016 09:47:26 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Jul 2016 20:17:23 +0530
Message-ID: <1469112443-8649-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ccsv6-native: update to new version 6.1.3.00034
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
X-List-Received-Date: Thu, 21 Jul 2016 14:47:38 -0000
Content-Type: text/plain

updated MD5/SHA256 checksum from the previous recipe

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
new file mode 100644
index 0000000..257e03e
--- /dev/null
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
@@ -0,0 +1,48 @@
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
+TI_CGT_ARM_VERSION = "15.12.1.LTS"
+
+SRC_URI = "http://install.source.dir.local/CCS${PV}_linux.tar.gz;name=ccsv6"
+
+S = "${WORKDIR}/CCS${PV}_linux"
+
+BINFILE = "CCS${PV}_linux/ccs_setup_${PV}.bin"
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
+TI_BIN_UNPK_CMDS = ""
+
+SRC_URI[ccsv6.md5sum] = "d95121970f8bcee944bf8b8e576bf3ec"
+SRC_URI[ccsv6.sha256sum] = "b785f040de8cccbc571923e34303fea92484677845df64a65abee2d3c248fa5b"
+
+SRC_URI[ccsv6.md5sum] = "ceaa5023c1a4b51bc637d3de1a15786b"
+SRC_URI[ccsv6.sha256sum] = "fb3205a21942da09684c871371513707c841c4fd8d88a62f6a7865b0a86cc492"
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
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INSANE_SKIP_${PN} = "arch libdir ldflags staticdev textrel dev-so"
+
+EXCLUDE_FROM_SHLIBS = "1"
-- 
1.9.1


