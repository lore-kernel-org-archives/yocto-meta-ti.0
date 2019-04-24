Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35302E00B58; Wed, 24 Apr 2019 08:44:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid *  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7112E0043B
	for <meta-ti@yoctoproject.org>; Wed, 24 Apr 2019 08:44:49 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3OFinX9060389
	for <meta-ti@yoctoproject.org>; Wed, 24 Apr 2019 10:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556120689;
	bh=EwrgrHLI9qczoTb6mtTOgwadDqQ+aQniOnNFtH/7Rhg=;
	h=From:To:Subject:Date;
	b=R22JNTFqSjjok3oynmUtmGE/DNAeL5//32BLz9OtRItHt0aCL+wGK9sLgkVCAPIuT
	rvmVAMOKNZeZk/5lwHuRpFGxehql9j/M3rkZZxV9faGKDZcC1MBbwVchyl1NsUm0x7
	kH+Wlt0E5cApGLyNUtDzZid8v3naSyqjmbJ2V6gA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3OFinaQ049305
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 24 Apr 2019 10:44:49 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 24 Apr 2019 10:44:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 24 Apr 2019 10:44:48 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3OFim3f016617
	for <meta-ti@yoctoproject.org>; Wed, 24 Apr 2019 10:44:48 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 24 Apr 2019 11:44:45 -0400
Message-ID: <1556120685-59598-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-cgt-arm-native: Upgrade to 18.12.1.LTS
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
X-List-Received-Date: Wed, 24 Apr 2019 15:44:50 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-cgt-arm-native_18.1.5.bb => ti-cgt-arm-native_18.12.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-arm-native_18.1.5.bb => ti-cgt-arm-native_18.12.1.bb} (47%)

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb b/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
similarity index 47%
rename from recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
rename to recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
index 0ed1939..232db1e 100644
--- a/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
+++ b/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
@@ -2,5 +2,5 @@ include ti-cgt-arm.inc
 
 LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3faed35326711d6596f0377279323df1"
 
-BINFILE_MD5 = "d0559bccc323002a9256dd68e1d223ab"
-BINFILE_SHA256 = "8462eb7ce837274582721ed75c73928865d7678aca23b30fde962cdd36c21414"
+BINFILE_MD5 = "af2378cf8d5d6f200ef3329f5a065529"
+BINFILE_SHA256 = "d90ae2360cd5b22912715ae7898d99352da1b97fd655f9a55d0d19a2a46bab0e"
-- 
1.9.1


