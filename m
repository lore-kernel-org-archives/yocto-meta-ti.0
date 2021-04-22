Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.1237.1619128575445452855
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 14:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oTKmJbEx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13MLuD8x033058;
	Thu, 22 Apr 2021 16:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619128573;
	bh=uXxoy4Fv1vdoCMU6F5908c2SGfN00dh2p4CMvS4IuBk=;
	h=From:To:CC:Subject:Date;
	b=oTKmJbExt8xI8ECTe3I9oxD12YwrGYF9lsSkNuPULniV8o63dp9WopFbPkJlG5ztW
	 GgaDf2zlraKTNq2ccc3qXCfRPnq1L/TbcTDBz7CEnwmdz33/w0Q1I2wFMRVjFFFC90
	 GR4alAzOX8pxjt3MAIuej1Rfn5LPCvEiVvtfKEP0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13MLuDxx021422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Apr 2021 16:56:13 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Apr 2021 16:56:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Apr 2021 16:56:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13MLuDoI106090;
	Thu, 22 Apr 2021 16:56:13 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Suman Anna <s-anna@ti.com>,
        Yogesh
 Siraswar <yogeshs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2] cmem: Update to new version 4.20.00.01
Date: Thu, 22 Apr 2021 16:56:13 -0500
Message-ID: <20210422215613.23149-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

The update brings the fix for 5.10.x linux kernel.
commit c0039f1fec25 ("cmemk: Fix 5.10 build errors for non Keystone2 platforms")
commit 8aba20e20bf7 ("cmemk: Fix build errors for 5.10+ kernels")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Reviewed-by: Suman Anna <s-anna@ti.com>
---
 recipes-bsp/cmem/cmem.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index c2719403..f568fa81 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
 
 BRANCH = "master"
-# This corresponds to version 4.16.00.00
-SRCREV = "4f970f053b42e8d2a6f1a8cd4b14786196468fd3"
+# This corresponds to version 4.20.00.01
+SRCREV = "86269258a48e0a9008dd9d5ebfae9da7ce843393"
 
-PV = "4.16.00.00+git${SRCPV}"
+PV = "4.20.00.01+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1

