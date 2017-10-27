Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D28BE00D47; Fri, 27 Oct 2017 08:59:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83165E00C01
	for <meta-ti@yoctoproject.org>; Fri, 27 Oct 2017 08:59:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9RFxbHk006988
	for <meta-ti@yoctoproject.org>; Fri, 27 Oct 2017 10:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509119977;
	bh=LeY4eP+gu8EivHxH27HPe2DLgx8W96hPriKEEWAzhYc=;
	h=From:To:CC:Subject:Date;
	b=mx+2H8CBaV+kdXQ9jSzshwPBbtUlGNP6AIp/ncljTLk/5i8D6Opl/gxwvwVPvjdE5
	cOKc0Yug9GrggrSpOs1TtseSNpBhqmWQMVrGUvYIzeQKWXMF7f2nt89W+vzeCgb5BY
	ZGAq7fAAb4cFao8WALZbmYzc1B0qH4kQPjaznYwE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9RFxbRF021038
	for <meta-ti@yoctoproject.org>; Fri, 27 Oct 2017 10:59:37 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 27 Oct 2017 10:59:37 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 27 Oct 2017 10:59:37 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9RFxZ46007397;
	Fri, 27 Oct 2017 10:59:36 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 27 Oct 2017 21:29:32 +0530
Message-ID: <1509119972-66256-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] ti-cgt-arm: add recipe for 16.9.2
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
X-List-Received-Date: Fri, 27 Oct 2017 15:59:39 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

from: meta-ti/morty 5df5bd9 

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb |  6 +++++
 recipes-ti/devtools/ti-cgt-arm.inc              | 34 +++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
 create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
new file mode 100644
index 0000000..8ff29ca
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
@@ -0,0 +1,6 @@
+include ti-cgt-arm.inc
+
+LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=c32eadd03472353c042a8a7c4568438b"
+
+BINFILE_MD5 = "7b73e51e9548a4a0bf3923a336b1a974"
+BINFILE_SHA256 = "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
new file mode 100644
index 0000000..436fab1
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-arm.inc
@@ -0,0 +1,34 @@
+SUMMARY = "TI ARM Code Generation Tools"
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


