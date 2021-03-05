Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.2348.1614979184387836048
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 13:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fOkXG3zA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 125LJg0M093273
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Mar 2021 15:19:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614979182;
	bh=Ss1c8d2C45Gu4uOTNJQXO+EQ1/mi9ZDTOluHAK5hp3w=;
	h=From:To:CC:Subject:Date;
	b=fOkXG3zArUKRyDL+sbsiHbZyFTpIzXOGb9ZM/YROJcCyT0+nxetqQgGt6N9KXk0YO
	 /9t0bGteJmyP3TcAe+SycY3AcqRWxgw6i6VWDLH60vAoHUtX2LpXfmiI4zHGp9KsH3
	 GcLNWFGC+47BGw4Cm/X6dMuRM7frYGk0uAfXkCbc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 125LJgBm124633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Mar 2021 15:19:42 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 15:19:42 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 15:19:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 125LJgr0051568;
	Fri, 5 Mar 2021 15:19:42 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-rtos: Update path for firmwares on j7200
Date: Fri, 5 Mar 2021 15:19:42 -0600
Message-ID: <20210305211942.19238-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Between j7200 firmware tags 07.03.00.10 to 07.03.00.16
the downloadable weburl link changed
from *processor-sdk-rtos-jacinto7 to *processor-sdk-rtos-j7200.

This patch is to fix the recipe to pick the firmware from the
expected location on the new tag.

Fixes j7200 build error reported due to
77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firmware")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index e5c35689..507d0000 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -31,6 +31,7 @@ DEFAULT_RTOS_SOC_am64xx = "am64x"
 
 DEFAULT_RTOS_WEBLINK = "undefined"
 DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
+DEFAULT_RTOS_WEBLINK_j7200-evm = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-j7200/firmware/${CORESDK_RTOS_VERSION}"
 DEFAULT_RTOS_WEBLINK_am65xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}"
 DEFAULT_RTOS_WEBLINK_am64xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
 
-- 
2.17.1

