Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1509.1582926818270902670
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Feb 2020 13:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aZE4u9Ca;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23DAEE01783; Fri, 28 Feb 2020 13:53:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E172EE0177E
	for <meta-ti@yoctoproject.org>; Fri, 28 Feb 2020 13:53:36 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SLrabu055069
	for <meta-ti@yoctoproject.org>; Fri, 28 Feb 2020 15:53:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582926816;
	bh=vEJF1jJlMpJkW0xGWg5+WhqEDDhPLlCjnMuvESWnQt0=;
	h=From:To:Subject:Date;
	b=aZE4u9CaWRb+cZVPi40Ip8xEruNL5nxr+KM7b2nIXjMlkXdeTgpTFCpATZU9Bs2dZ
	 YqLTc1UMa7HgWi+/Zzkyrvoey+orm+fr82Mr8ZoC3atxD3Ik6tErNd85/QVG/xjiPr
	 El0SOTx8C+YYy2GLx3S2ng3DieWlJ7MqGLKWQZAM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01SLratZ043415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 28 Feb 2020 15:53:36 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 15:53:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 15:53:35 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SLrZtj069400
	for <meta-ti@yoctoproject.org>; Fri, 28 Feb 2020 15:53:35 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH v2] ti-cgt-arm: Update to 18.12.5
Date: Fri, 28 Feb 2020 16:53:33 -0500
Message-ID: <20200228215333.28674-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The License checksum has changed due to version number change, but the
license itself has not changed
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-cgt-arm_18.12.1.bb => ti-cgt-arm_18.12.5.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-arm_18.12.1.bb => ti-cgt-arm_18.12.5.bb} (81%)

diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
similarity index 81%
rename from recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
rename to recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
index eecde58f..9e651819 100644
--- a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
+++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "TI ARM Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=ab7a61241e90fcd144a756d88294cf30"
+LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=79631eb21b2e5b7190cd3ff1dfd41108"
 
 require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-staging.inc
@@ -27,8 +27,8 @@ do_install() {
     cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
 }
 
-SRC_URI[cgt_arm_installer.md5sum] = "af2378cf8d5d6f200ef3329f5a065529"
-SRC_URI[cgt_arm_installer.sha256sum] = "d90ae2360cd5b22912715ae7898d99352da1b97fd655f9a55d0d19a2a46bab0e"
+SRC_URI[cgt_arm_installer.md5sum] = "e9e668332cf86c965b4da9d1d488426b"
+SRC_URI[cgt_arm_installer.sha256sum] = "da976143128c619a278cb4214a4295c409d100f9e65ad2f4d0d1039db7cf98f4"
 
 BINFILE_NAME = "cgt_arm_installer"
 
-- 
2.17.1

