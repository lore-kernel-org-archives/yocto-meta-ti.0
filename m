Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2FFC433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 18:59:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.1385.1651517996696898739
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 11:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QTK2Smry;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 242IxsoF022709;
	Mon, 2 May 2022 13:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651517995;
	bh=cAwLzUglKX3gM+oqKzGkOm1PUxk2nYHH89GkCvHU7ZM=;
	h=From:To:Subject:Date;
	b=QTK2SmryhIrvrH4JfYIsc5DACYu0CZyLM1nJ/dktZ+ZQR2UPYKpyaKURQjg32AGN2
	 g27PmIG4UMdgeTlLRzssxnx7ZfXeLiRr1jvjJnCcF2Ka2eAZZMXXXjxxWdXpoGW+aa
	 lHyz1CBEjIGHwF6n39/j0FMv1qNmm3tjgygc/U0w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 242IxsRH092825
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 May 2022 13:59:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 2
 May 2022 13:59:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 2 May 2022 13:59:54 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 242Ixs6S079706;
	Mon, 2 May 2022 13:59:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nlbH0-0006ru-9f; Mon, 02 May 2022 13:59:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] uio-module-drv-test: Fix build with clang
Date: Mon, 2 May 2022 13:59:54 -0500
Message-ID: <20220502185954.26363-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 18:59:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14676

Point to an updated SRCREV that fixes a compile error with the clang
compiler.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
index f483010e..daae836f 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -2,10 +2,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 
 BRANCH = "master"
-# This corresponds to version 02.02.01.00
-UIO_MODULE_DRV_SRCREV = "bda9260f2220840a60ec0fbc8011cbadf3cf1b91"
+# This corresponds to version 02.03.01.00
+UIO_MODULE_DRV_SRCREV = "78c535afe8f8cc0b715500a63eab0bc3606c0579"
 
-PV = "2.2.1.0+git${SRCPV}"
+PV = "2.3.1.0+git${SRCPV}"
 
 UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
 UIO_MODULE_DRV_GIT_PROTOCOL = "git"
-- 
2.17.1


