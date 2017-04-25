Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D0A6E00AF8; Tue, 25 Apr 2017 04:26:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [198.47.19.16 listed in dnsbl.sorbs.net]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D11E2E00AF0
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 04:26:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3PBQDBe009930
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493119573;
	bh=p8fkSwO+ImZ0uir/XFp+0Xfs1ouJdDNukQEuqe2htHo=;
	h=From:To:CC:Subject:Date;
	b=kp/vHYPXeSbf7WMKegTAitSG1QTp5g9EpiKtRi1iibqOiwQQyRn4VGaS+tcUiYo0t
	CtS/rcLHgJjZoJYXnYHcY2u/FaH8tL7vFJtBgFpmPX2ml2UhPrha0Onm30Bx+reiae
	+KChIWMlTkfv/Ic8y/v2gCHGxsN5nZh6FsYLBtRY=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBQ8SZ005500
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:26:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Apr 2017 06:26:07 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBQ6dI023407;
	Tue, 25 Apr 2017 06:26:07 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 25 Apr 2017 16:56:02 +0530
Message-ID: <1493119564-36769-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2
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
X-List-Received-Date: Tue, 25 Apr 2017 11:26:25 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb |  8 ++++++
 recipes-ti/devtools/ti-cgt-arm.inc              | 35 +++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
 create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
new file mode 100644
index 0000000..c4fc7f0
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
@@ -0,0 +1,8 @@
+include ti-cgt-arm.inc
+
+LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=c32eadd03472353c042a8a7c4568438b"
+
+BINFILE_MD5 = "7b73e51e9548a4a0bf3923a336b1a974"
+BINFILE_SHA256 = "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
+
+PR_append = "r2"
diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
new file mode 100644
index 0000000..8cc1ca4
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-arm.inc
@@ -0,0 +1,35 @@
+SUMMARY= "TI ARM Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
+
+inherit native
+require recipes-ti/includes/ti-unpack.inc
+require recipes-ti/includes/ti-staging.inc
+require recipes-ti/includes/ti-paths.inc
+
+S = "${WORKDIR}/ti-cgt-arm-${PV}"
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
+SRC_URI[cgt_arm_installer.md5sum] = "${BINFILE_MD5}"
+SRC_URI[cgt_arm_installer.sha256sum] = "${BINFILE_SHA256}"
+
+BINFILE_NAME = "cgt_arm_installer"
+BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
+
+FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+INSANE_SKIP_${PN} += "arch staticdev"
-- 
1.9.1


