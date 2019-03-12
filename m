Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2FC4E00AD5; Mon, 11 Mar 2019 18:44:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC052E00AD5
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 18:44:03 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2C1i3j0093052
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552355043;
	bh=so0WIheTZ7Dx4WRHxouAU6CtVAe83RqkHf5yE0PEJPk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lZTI7opmOiKQ/kUj/KgiypTMAK91wxkzH7uRF/ls3JnnDy8NMakcplNJj2C78EDZC
	RQSMmBWdM3HxuB+p1eOEtz0UcgAHxGonZdDYtTTi9Vbktd2hDGqsHrb2nePzoZabog
	zpG6tUxzxXa4WfzpIm18XyHvFFSV1a8zKpTvn60w=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2C1i2Zu085551
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:44:03 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 20:44:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 11 Mar 2019 20:44:02 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2C1hssP014989
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:44:01 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2019 21:43:44 -0400
Message-ID: <1552355028-25739-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552355028-25739-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1552355028-25739-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 3/7] ti-cg-xml: Update to version 2.61.00
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
X-List-Received-Date: Tue, 12 Mar 2019 01:44:04 -0000
Content-Type: text/plain

The license checksum change is due to the copyright year and version.
The license itself has not changed.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb}      | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename recipes-ti/devtools/{ti-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb} (63%)

diff --git a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
similarity index 63%
rename from recipes-ti/devtools/ti-cg-xml_2.41.00.bb
rename to recipes-ti/devtools/ti-cg-xml_2.61.00.bb
index 5c0ff63..e618af5 100644
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
1.9.1


