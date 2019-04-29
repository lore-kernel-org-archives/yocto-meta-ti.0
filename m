Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D0A2E00CAA; Mon, 29 Apr 2019 11:15:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EAD2E0043B
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 11:15:05 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TIF5IN084648
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 13:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556561705;
	bh=q0pCc+FAUo/os42M+2zEgMOanJpxUCLmevruEKRmuxA=;
	h=From:To:Subject:Date;
	b=ePiNAh2/GB/5gP3TpH6NwxRo8g3iwr/TNiRzoGq45+zoIU9MnNihTXuUgaNb0/eYS
	3ibaFHbZBbbvLQPaR8Te59zSm0N4NTqYze01YkrsWZdN9Z2Ha0u4Y2HyLbZ8KhCc8H
	ZTZ44h1fRmSnRWVJosaGNatFempwXaj3PaxMqlXM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TIF5Qs068939
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 13:15:05 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 13:15:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 13:15:05 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TIF5vd087791
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 13:15:05 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Apr 2019 14:14:59 -0400
Message-ID: <1556561699-57509-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v3] ti-cgt-arm-native: Upgrade to 18.12.1.LTS
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
X-List-Received-Date: Mon, 29 Apr 2019 18:15:06 -0000
Content-Type: text/plain

The checksum changed due to version & year changes. The licenses remain
the same

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v3 - Updating the commit description citing no license change
 v2 - Correcting the LIC_CHECKSUM

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


