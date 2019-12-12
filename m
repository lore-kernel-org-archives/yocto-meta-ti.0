Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.967.1576179220637530385
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Dec 2019 11:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wOhOXURG;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: tmannan@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 378E8E01226; Thu, 12 Dec 2019 11:33:40 -0800 (PST)
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
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B145E00852
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2019 11:33:37 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCJXaiF101374
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2019 13:33:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576179216;
	bh=rprMVsRfIDtVjSyLDwzD4Qxi/ijHWaC8p2QnRtBsqlM=;
	h=From:To:Subject:Date;
	b=wOhOXURGDcULCZcP7XqhfKZc06cQRjt+hbQGqJkAPlvml24ACNvF/aHZuaf/hNLcd
	 dSI2zKJISWzUGerSzfDSutbBOrJL2Irqz9HXwnbD9M+j1Utjv90VuwjBBUdVaFqMlK
	 b+/1M4bnPUf3Q2Fk/x2/F3JHc85ttb0FsES7NBVA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCJXaWL091952
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2019 13:33:36 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 13:33:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 13:33:36 -0600
Received: from ares-ubuntu1.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCJXZcP007691
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2019 13:33:36 -0600
From: "Tinku Mannan" <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH] udma-lld: Update to support multiple board list for make package
Date: Thu, 12 Dec 2019 14:33:32 -0500
Message-ID: <1576179212-31850-1-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Tinku Mannan <tmannan@ti.com>
---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
index 214317c..a82eb36 100644
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
+++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://udma.h;beginline=1;endline=31;md5=83d177cf3df55c16b27
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append = " osal-rtos \
                    sciclient-rtos \
@@ -41,7 +41,7 @@ do_configure() {
     cd ${S}
 
     # make the release package before building it
-    make package BOARD=${TI_PDK_LIMIT_BOARDS} DEST_ROOT=${UDMA_PACKAGE_BASE} PDK_UDMA_COMP_PATH=${S}
+    make package BOARD="${TI_PDK_LIMIT_BOARDS}" DEST_ROOT=${UDMA_PACKAGE_BASE} PDK_UDMA_COMP_PATH=${S}
 }
 
 do_compile() {
-- 
2.7.4

