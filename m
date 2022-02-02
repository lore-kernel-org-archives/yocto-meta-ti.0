Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2297.1643826805572989416
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WHD4O+yX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IXOLn082508;
	Wed, 2 Feb 2022 12:33:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826804;
	bh=lf2D3bjEJP72D+eNslTk5adpGIM9CQsr7/P9iIU99H0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WHD4O+yXBopRBkWRxROJ/Ts0FHa80zMvuVy7FbFKaupWvr0YxBu8fllwNPQk7nwFN
	 aF+zQ/Sb4HV9kpdqV+uhtFVeyTKII8SR9iVX1249ShqhBmcbaOkfipDnzlVWp7FNbZ
	 AQOoC5xXBUnnXDN34ysLYRjagCQd3RSZdegCab7Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IXOZf002446
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:33:24 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:33:24 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:33:23 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IXNDZ038682;
	Wed, 2 Feb 2022 12:33:23 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKRX-0007f0-RJ; Wed, 02 Feb 2022 12:33:23 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 07/12] recipies-ti: ti-rtos-firmware: Fixup typo for rtos firmware
Date: Wed, 2 Feb 2022 12:33:17 -0600
Message-ID: <20220202183322.29360-8-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202183322.29360-1-reatmon@ti.com>
References: <20220202183322.29360-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nishanth Menon <nm@ti.com>

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index d932acf1..44c1ad09 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -195,14 +195,14 @@ ALTERNATIVE_${PN}_j7200-hs-evm = "\
                     "
 
 ALTERNATIVE_${PN}_j721s2-evm = "\
-                    j7-mcu-r5f0_0-fw \
-                    j7-mcu-r5f0_1-fw \
-                    j7-main-r5f0_0-fw \
-                    j7-main-r5f0_1-fw \
-                    j7-main-r5f1_0-fw \
-                    j7-main-r5f1_1-fw \
-                    j7-c71_0-fw\
-                    j7-c71_1-fw\
+                    j721s2-mcu-r5f0_0-fw \
+                    j721s2-mcu-r5f0_1-fw \
+                    j721s2-main-r5f0_0-fw \
+                    j721s2-main-r5f0_1-fw \
+                    j721s2-main-r5f1_0-fw \
+                    j721s2-main-r5f1_1-fw \
+                    j721s2-c71_0-fw \
+                    j721s2-c71_1-fw \
                     "
 
 # Set up link names for the firmwares
-- 
2.17.1

