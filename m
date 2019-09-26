Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69A04E00ECA; Thu, 26 Sep 2019 11:17:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6F98E00EC8
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:17:11 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QIHBWQ129338
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 13:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569521831;
	bh=LIrcMcB1uMPizWW/c/PLu7ZbfbaQQ94Z8YQtlVnsE14=;
	h=From:To:Subject:Date;
	b=PESljwD5jBtJ75CtAzugrRhDR3P5KtEu6tqrblMg5wjusCoKqoHWxgxWapMsH2OhI
	yPpnxbKnQbXGf7w8VhmnprmSmtW2OqlpV3JiiKNQO0YGDJCBtc0E7ZkXjz0V8fn6T7
	p2mpJJElXMrrDlQDyGggSA16a4/7XTT8jNHrd93o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QIHAIS026501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 13:17:10 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 26 Sep 2019 13:17:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 26 Sep 2019 13:17:03 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QIHAUA079468
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 13:17:10 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Sep 2019 14:17:06 -0400
Message-ID: <1569521826-10051-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-cgt7x: Update to version 1.2.0
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
X-List-Received-Date: Thu, 26 Sep 2019 18:17:12 -0000
Content-Type: text/plain

The license checksum changed due to the version, but the license itself
has not changed since the last release (1.1.0)
---
 .../devtools/{ti-cgt7x_1.1.0.bb => ti-cgt7x_1.2.0.bb}       | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename recipes-ti/devtools/{ti-cgt7x_1.1.0.bb => ti-cgt7x_1.2.0.bb} (68%)

diff --git a/recipes-ti/devtools/ti-cgt7x_1.1.0.bb b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
similarity index 68%
rename from recipes-ti/devtools/ti-cgt7x_1.1.0.bb
rename to recipes-ti/devtools/ti-cgt7x_1.2.0.bb
index 72bbcc1..09178af 100644
--- a/recipes-ti/devtools/ti-cgt7x_1.1.0.bb
+++ b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
@@ -8,7 +8,7 @@ libraries and standard header files needed to produce a working DSP application.
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}/C7000_1.0.x_CodeGenerationTools_Manifest.html;md5=3074e433c5d52657076d1d138dfbdaf8"
+LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}.STS/C7000_Code_Generation_Tools_1.x_manifest.html;md5=f1156d241d104c281bc64a6ec8eadc64"
 
 require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-paths.inc
@@ -17,23 +17,22 @@ require recipes-ti/includes/ti-paths.inc
 COMPATIBLE_HOST = "x86_64.*-linux"
 COMPATIBLE_HOST_class-target = "null"
 
-BINFILE = "ti_cgt_c7000_${PV}_linux_installer_x86.bin"
+BINFILE = "ti_cgt_c7000_${PV}.STS_linux_installer_x86.bin"
 BINFILE_NAME = "cgt7x_x86_installer"
 
-# Please note, "install.source.dir.local" is not a real URL, below files need to be pre-downloaded
-SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
+SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${PV}.STS/${BINFILE};name=${BINFILE_NAME}"
 
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
-SRC_URI[cgt7x_x86_installer.md5sum]    = "feb668b4213403c661909adcf65d2ba8"
-SRC_URI[cgt7x_x86_installer.sha256sum] = "4a3954c973622c00a9b91fa90473cf921f4b763300b0e7c32735304867856ab8"
+SRC_URI[cgt7x_x86_installer.md5sum]    = "813840908f333dd2a31f92edec71c1fb"
+SRC_URI[cgt7x_x86_installer.sha256sum] = "21379811a8857489f72ca8ec45a46eb086ced0bdbb58e78f73a86e63984ab2f5"
 
 S = "${WORKDIR}/c7000_${PV}"
 
 do_install() {
     install -d ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
-    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c7000_${PV}/ti-cgt-c7000_${PV}/. ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
+    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c7000_${PV}/ti-cgt-c7000_${PV}.STS/. ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
 }
 
 
-- 
1.9.1


