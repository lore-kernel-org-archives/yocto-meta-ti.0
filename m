Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B2C4E00D1E; Wed, 13 Mar 2019 20:27:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 864FCE00D13
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2019 20:27:38 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2E3RbDZ101598
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2019 22:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552534057;
	bh=4Hm8XkbVqFqlgvVT19CD4UJXuz0OJciefozhBT+93eg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gZWiFP/4634yINgamVQda1JUt+5FBXXazgrYBDC69Xw4CPGDGXz8+ACltj2WovyEq
	VzRveECbK4FjOtPUdm+iBxKJZB+g/iJZM/v7gWDL2gYQOFAR7Og81FrRzV0uFd+eda
	Rr+yeqlQ3CAImjm6MaEPnwzd1ylirw9PX7NMk/oo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2E3Rbg5047758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2019 22:27:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 13 Mar 2019 22:27:37 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 13 Mar 2019 22:27:37 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2E3RaNw017670;
	Wed, 13 Mar 2019 22:27:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Mar 2019 03:18:06 +0000
Message-ID: <20190314031810.27721-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190314031810.27721-1-denys@ti.com>
References: <20190314031810.27721-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/thud/master][PATCH v2 2/6] ti-cg-xml: Update to version 2.61.00
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
X-List-Received-Date: Thu, 14 Mar 2019 03:27:39 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

The license checksum change is due to the copyright year and version.
The license itself has not changed.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...i-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb} | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename recipes-ti/devtools/{ti-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb} (63%)

diff --git a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
similarity index 63%
rename from recipes-ti/devtools/ti-cg-xml_2.41.00.bb
rename to recipes-ti/devtools/ti-cg-xml_2.61.00.bb
index 5c0ff63b..e618af5a 100644
--- a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
+++ b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
@@ -7,22 +7,21 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 require recipes-ti/includes/ti-unpack.inc
 
-PV = "2_41_00"
-
+PV = "2.61.00"
+PE = "1"
 S = "${WORKDIR}/cg_xml_${PV}"
 
 SRC_URI = "\
-    http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/cg_xml_v${PV}/cg_xml-v${PV}-Linux-x86-Install;name=cgxmlbin_linux \
+    http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/cg_xml_v${@'${PV}'.replace('.','_')}/cgxml-${PV}-linux-installer.run;name=cgxmlbin_linux \
 "
+LIC_FILES_CHKSUM = "file://cg_xml_${PV}_Manifest.pdf;md5=fc02a39748ba50373f32b2f4a5e3a684"
 
-LIC_FILES_CHKSUM = "file://cg_xml_${PV}_Manifest.pdf;md5=ba23d76ef3d5ec111b03267105c91bd4"
-
-SRC_URI[cgxmlbin_linux.md5sum] = "9e421f25f6da455b0155570ce0e62628"
-SRC_URI[cgxmlbin_linux.sha256sum] = "bbc25f4abe27a8b93bae1d8581c3dee87111c3769c305d086287038ee9038cbf"
+SRC_URI[cgxmlbin_linux.md5sum] = "6ce60caa97bbf15158d806fb062fadff"
+SRC_URI[cgxmlbin_linux.sha256sum] = "da77cb10bd3d5de89e27e4ce8f4408a2e50775c8980225f9a828ddc242bb81f9"
 
-BINFILE="cg_xml-v${PV}-Linux-x86-Install"
+BINFILE="cgxml-${PV}-linux-installer.run"
 TI_BIN_UNPK_CMDS=""
-TI_BIN_UNPK_ARGS="--prefix ${S} --mode silent"
+TI_BIN_UNPK_ARGS="--prefix ${S} --mode unattended"
 
 do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-- 
2.17.1


