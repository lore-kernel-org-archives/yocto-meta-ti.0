Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 948DBE00EBF; Fri,  2 Aug 2019 11:01:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E8E6E00EBB
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 11:01:15 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72I1FCg033278
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 13:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564768875;
	bh=pwCha8dcMgzDydTBYbPYt8KhjsoAKPSyXd0KfVIz+9M=;
	h=From:To:Subject:Date;
	b=xoLQoRftl4Vvk2ClF532H7p0ObGHY5/aH/RN5wEH9fYITgYMazU5QE/dajWA9DHCi
	R7ZAPlS6v4V8MZcSCNhi+hQ+ZSrN6qdbTWOKFSLeK9oVSwual5/cIrS+AXki0tJGG8
	+ltjR39KsQEVEBI13TB/DflrI6dRMsDL+31CyJoU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72I1F6Y033628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 13:01:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 13:01:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 13:01:15 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72I1Etf045884
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 13:01:15 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 2 Aug 2019 14:01:13 -0400
Message-ID: <1564768873-22844-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-ns: Update to version 2.60.01.06
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
X-List-Received-Date: Fri, 02 Aug 2019 18:01:16 -0000
Content-Type: text/plain

Please note that LIC CHKSUM has changed due to version change.
The licenses themselves have not changed.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ns/{ti-ns_2.60.00.07.bb => ti-ns_2.60.01.06.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/ns/{ti-ns_2.60.00.07.bb => ti-ns_2.60.01.06.bb} (63%)

diff --git a/recipes-ti/ns/ti-ns_2.60.00.07.bb b/recipes-ti/ns/ti-ns_2.60.01.06.bb
similarity index 63%
rename from recipes-ti/ns/ti-ns_2.60.00.07.bb
rename to recipes-ti/ns/ti-ns_2.60.01.06.bb
index a5da7f9..d86fcd5 100644
--- a/recipes-ti/ns/ti-ns_2.60.00.07.bb
+++ b/recipes-ti/ns/ti-ns_2.60.01.06.bb
@@ -1,13 +1,13 @@
 require ti-ns.inc
 
-PV = "2_60_00_07"
+PV = "2_60_01_06"
 PR = "r0"
 SRC_URI = "http://software-dl.ti.com/targetcontent/ns/${PV}/exports/ns_${PV}.zip;name=nszip"
 
 LIC_FILES_CHKSUM = "file://manifest_ns_${PV}.html;md5=e15dc261b0ef14c6fbabba24abcde4f0"
 
-SRC_URI[nszip.md5sum] = "7ad9f9fc79b4718bfa9b0042cb28d06f"
-SRC_URI[nszip.sha256sum] = "8d2901e49ee72dde2e88370981e931c656e89efc7e0d5e3f775dde7d720e2b19"
+SRC_URI[nszip.md5sum] = "b78d86423e9c4d148be5fba5903cc2c7"
+SRC_URI[nszip.sha256sum] = "f66b2fda6ab02585020e67d84897305209f3e141847581a214ccf123c3f15f00"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.9.1


