Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 220EEE00EC9; Fri,  2 Aug 2019 11:02:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7724DE00EC5
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 11:02:01 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72I21GM096409
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 13:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564768921;
	bh=SQhMnwvu83H3dBrw9t1/+bxKvdMl8yfKuMC1hgnDp+M=;
	h=From:To:Subject:Date;
	b=ozSGgv9AyPWlYJ3Xo1U68AGPTsfQn/ae7YAQrfmI5apvtNnw7vgHyVl9IAl2GtC3r
	MBbzIwMZzdarPdmk5cUitnKmA++hUqihTvTj6nYtMJiffL/G4TX3flNnnbsbc5/C3d
	r9ziFYB5CsvlVy42sCV3Ou+QEl1fdxi/lhGizIYY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72I21JT095907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 13:02:01 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 13:02:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 13:02:00 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72I20T9046629
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 13:02:00 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 2 Aug 2019 14:01:59 -0400
Message-ID: <1564768919-23965-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-xdctools: Update to version 3.55.02.22
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
X-List-Received-Date: Fri, 02 Aug 2019 18:02:03 -0000
Content-Type: text/plain

The license checksum changed due to version, but the licenses haven't
changed

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-xdctools_3.51.01.18.bb => ti-xdctools_3.55.02.22.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/devtools/{ti-xdctools_3.51.01.18.bb => ti-xdctools_3.55.02.22.bb} (35%)

diff --git a/recipes-ti/devtools/ti-xdctools_3.51.01.18.bb b/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
similarity index 35%
rename from recipes-ti/devtools/ti-xdctools_3.51.01.18.bb
rename to recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
index 35258b4..7481783 100644
--- a/recipes-ti/devtools/ti-xdctools_3.51.01.18.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
@@ -1,9 +1,9 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
 
-PV = "3_51_01_18"
+PV = "3_55_02_22"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=7d8508a640d8e76fe372141df01c351f"
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=2e742b9757bc9ce0241aadba9f627ab8"
 
-SRC_URI[xdczip.md5sum] = "54b80b603471623c1dbb0cfeb75b0fe2"
-SRC_URI[xdczip.sha256sum] = "9bbbf433f0970bcb0cbf938615afe4d54420ecc56bc6e872f1a004338a8f19d5"
+SRC_URI[xdczip.md5sum] = "bb9154d677ce4724a5eac73817b23a0f"
+SRC_URI[xdczip.sha256sum] = "bf90dfbbe298458c736d81d5631db25b335e79146923a4a50fab217e02723e7b"
-- 
1.9.1


