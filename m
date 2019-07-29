Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 053A7E00D00; Mon, 29 Jul 2019 10:54:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D417AE00CB9
	for <meta-ti@yoctoproject.org>; Mon, 29 Jul 2019 10:54:10 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6THsAAU056728
	for <meta-ti@yoctoproject.org>; Mon, 29 Jul 2019 12:54:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564422850;
	bh=C3q0gnP5JaJz3gCWtfdZ+gsHridIFw12uFthcjb8Z9c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nKNa4u51lMYzGAesWw/C6/bVJNF7Qtvp+KwuYikctDm6ugAq41xs/ri8i0EXg9DDD
	pIIivmQXFuSSnlap9PF0laJjE75782gGJbW8k8zfCk8K/YLrRGPDNlcwpxn36B8S+a
	c9hfjl4DxI9qJS0nGOlH38rEnEpMzy80c/vvYPvg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6THsAKD098090
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 29 Jul 2019 12:54:10 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Jul 2019 12:54:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Jul 2019 12:54:09 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6THs8Tn029802;
	Mon, 29 Jul 2019 12:54:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Jul 2019 13:37:26 -0400
Message-ID: <1564421847-25948-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564421847-25948-1-git-send-email-j-stiffler@ti.com>
References: <1564421847-25948-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 2/3] ti-cgt-arm: consolidate into single file
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
X-List-Received-Date: Mon, 29 Jul 2019 17:54:12 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb | 38 ++++++++++++++++++++++--
 recipes-ti/devtools/ti-cgt-arm.inc               | 36 ----------------------
 2 files changed, 35 insertions(+), 39 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-cgt-arm.inc

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb b/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
index 7df9660..5d72406 100644
--- a/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
+++ b/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
@@ -1,6 +1,38 @@
-include ti-cgt-arm.inc
+SUMMARY = "TI ARM Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
 
 LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=ab7a61241e90fcd144a756d88294cf30"
 
-BINFILE_MD5 = "af2378cf8d5d6f200ef3329f5a065529"
-BINFILE_SHA256 = "d90ae2360cd5b22912715ae7898d99352da1b97fd655f9a55d0d19a2a46bab0e"
+inherit native
+require recipes-ti/includes/ti-unpack.inc
+require recipes-ti/includes/ti-staging.inc
+require recipes-ti/includes/ti-paths.inc
+
+S = "${WORKDIR}/ti-cgt-arm-${PV}"
+
+PR = "r0"
+
+SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
+
+BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
+TI_BIN_UNPK_ARGS = "--prefix ${S}"
+TI_BIN_UNPK_CMDS = ""
+
+do_install() {
+    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
+    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
+}
+
+SRC_URI[cgt_arm_installer.md5sum] = "af2378cf8d5d6f200ef3329f5a065529"
+SRC_URI[cgt_arm_installer.sha256sum] = "d90ae2360cd5b22912715ae7898d99352da1b97fd655f9a55d0d19a2a46bab0e"
+
+BINFILE_NAME = "cgt_arm_installer"
+
+FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+INSANE_SKIP_${PN} += "arch staticdev"
diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
deleted file mode 100644
index d2d768c..0000000
--- a/recipes-ti/devtools/ti-cgt-arm.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "TI ARM Code Generation Tools"
-HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
-LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
-
-inherit native
-require recipes-ti/includes/ti-unpack.inc
-require recipes-ti/includes/ti-staging.inc
-require recipes-ti/includes/ti-paths.inc
-
-S = "${WORKDIR}/ti-cgt-arm-${PV}"
-
-PR = "r0"
-
-SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
-
-BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
-TI_BIN_UNPK_ARGS = "--prefix ${S}"
-TI_BIN_UNPK_CMDS = ""
-
-do_install() {
-    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
-    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
-}
-
-SRC_URI[cgt_arm_installer.md5sum] = "${BINFILE_MD5}"
-SRC_URI[cgt_arm_installer.sha256sum] = "${BINFILE_SHA256}"
-
-BINFILE_NAME = "cgt_arm_installer"
-
-FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-INSANE_SKIP_${PN} += "arch staticdev"
-- 
2.7.4


