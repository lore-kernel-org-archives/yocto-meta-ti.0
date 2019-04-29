Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DEF1E00C05; Mon, 29 Apr 2019 08:28:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1264FE0091D
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 08:28:49 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TFSnsf017998
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 10:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556551729;
	bh=kExLqTzd107v92s1yfvZHomVY6UdR7cZoeBt28iGlLU=;
	h=From:To:Subject:Date;
	b=O3yP5zmDOmHYAPeFq5N282KXgSZ4xlmfveJQu7AjLrNqGuQ9yIL4ug/3W1tq7UySw
	Zjfv6wBLEpHhVuQArs65DYofU/25SqRoghKLIJCjhzMzx2dNXVBnqO8u5iZLmQo0N3
	B6jJbsSik/PHMP3CAWkzu0JtYDVgBq9oo5m3pNDc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TFSne9027377
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 10:28:49 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 10:28:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 10:28:48 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TFSmf6116360
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 10:28:48 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Apr 2019 11:28:44 -0400
Message-ID: <1556551724-56769-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2] ti-cgt-arm-native: Upgrade to 18.12.1.LTS
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
X-List-Received-Date: Mon, 29 Apr 2019 15:28:51 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Corrected the LIC_CHECKSUM

 .../{ti-cgt-arm-native_18.1.5.bb => ti-cgt-arm-native_18.12.1.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-arm-native_18.1.5.bb => ti-cgt-arm-native_18.12.1.bb} (9%)

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb b/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
similarity index 9%
rename from recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
rename to recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
index 0ed1939..7df9660 100644
--- a/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
+++ b/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
@@ -1,6 +1,6 @@
 include ti-cgt-arm.inc
 
-LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3faed35326711d6596f0377279323df1"
+LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=ab7a61241e90fcd144a756d88294cf30"
 
-BINFILE_MD5 = "d0559bccc323002a9256dd68e1d223ab"
-BINFILE_SHA256 = "8462eb7ce837274582721ed75c73928865d7678aca23b30fde962cdd36c21414"
+BINFILE_MD5 = "af2378cf8d5d6f200ef3329f5a065529"
+BINFILE_SHA256 = "d90ae2360cd5b22912715ae7898d99352da1b97fd655f9a55d0d19a2a46bab0e"
-- 
1.9.1


