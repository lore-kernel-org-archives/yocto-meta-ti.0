Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1625.1576602988208111117
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2019 09:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uqjbhGsT;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: sam.nelson@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1839AE0126C; Tue, 17 Dec 2019 09:16:28 -0800 (PST)
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
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33A5AE00B7A
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2019 09:16:26 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHHGPGV091351
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2019 11:16:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576602985;
	bh=4p55GDYnJ+w9f+9Rx3OsZoLF+pShq+xV6bk4sgp9F7Y=;
	h=From:To:CC:Subject:Date;
	b=uqjbhGsTphga9UwXjK/jtGbgqjmrDnE3NZaWjl5G8me/tgvt/qc63iwGhne0ALScE
	 gr1u6ke0eTpK9IrGRsMtFNI1yrFhyxRpOgbf/gb99ssUV3OuPzeBEpiJhHDIL8Jg1O
	 YyfFXastY8/0Tfic0YK96MXfjFlcnEcSxRar59DA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHHGPJS014836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2019 11:16:25 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 11:16:25 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 11:16:25 -0600
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHHGPSq066140;
	Tue, 17 Dec 2019 11:16:25 -0600
From: "Sam Nelson" <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Sam Nelson <sam.nelson@ti.com>
Subject: [meta-ti][thud/master][PATCH] ti-ipc: Update ipc-examples to 3.50.04.08 with bug fixes
Date: Tue, 17 Dec 2019 12:16:22 -0500
Message-ID: <1576602982-40418-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index baf1ccc..4d0d449 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -26,8 +26,8 @@ name=${TI_IPC_METADATA_NAME}"
 
 # Corresponds to tag: 3.50.04.08
 TI_IPC_METADATA_SRCREV = "48788ea79190c4995df4c802e8aa4e17f332943d"
-# Corresponds to tag: 3.50.04.07B
-TI_IPC_EXAMPLES_SRCREV = "ad3d694e30367a5c04525aef7c6ee9a33896fd59"
+# Corresponds to tag: 3.50.04.08
+TI_IPC_EXAMPLES_SRCREV = "4707fcbbe0d136e781c4a7ffdc072be407c34358"
 
 SRCREV_FORMAT = "default"
 SRCREV_ipc-metadata = "${TI_IPC_METADATA_SRCREV}"
@@ -39,7 +39,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
 
-PR = "${INC_PR}.r1"
+PR = "${INC_PR}.r2"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
-- 
1.9.1

