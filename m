Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.2815.1618463468464442880
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 22:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GI3yt2iY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B7Ho119592;
	Thu, 15 Apr 2021 00:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618463467;
	bh=MJLPq++LXeqJrDfw8g9WBR92kU2eCxftq5htYRFmKHs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GI3yt2iY45MqqnIKbl+nHAPS40om38XWTJlovZj3E9H/0cRUktPoHUNktbEhLhFVm
	 uWMJpHuHO2Gk6IrTpLD/kyBcMtSTJecyoMxt6lfwT3favKj3PfDqFChyYoLi74n5jE
	 R7PIYrvFv1cSeMd236PgOwpcP701Tu1pd29x95JA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13F5B64L114894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 00:11:07 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 00:11:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 00:11:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B6Ki050063;
	Thu, 15 Apr 2021 00:11:07 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 6/6] conf/machine: am65xx: Remove non-existent dtb* from 5.10
Date: Thu, 15 Apr 2021 00:11:05 -0500
Message-ID: <20210415051105.1626-7-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415051105.1626-1-praneeth@ti.com>
References: <20210415051105.1626-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove the non-existent dtb* , as they are not currently present on
ti-linux-5.10.y.

-    ti/k3-am654-base-board-sr1.dtb
-    ti/k3-am654-gp.dtbo
-    ti/k3-am654-idk.dtbo
-    ti/k3-am654-idk-sr1.dtbo
-    ti/k3-am654-evm-hdmi.dtbo
-    ti/k3-am654-evm-oldi-lcd1evm.dtbo
-    ti/k3-am654-evm-tc358876.dtbo
-    ti/k3-am654-pcie-usb2.dtbo
-    ti/k3-am654-pcie-usb3.dtbo
-    ti/k3-am654-base-board-jailhouse.dtbo
-    ti/k3-am654-evm-prupwm.dtbo

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/am65xx.inc | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 547c2e87..2a813f20 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -8,17 +8,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
-    ti/k3-am654-base-board-sr1.dtb \
-    ti/k3-am654-gp.dtbo \
-    ti/k3-am654-idk.dtbo \
-    ti/k3-am654-idk-sr1.dtbo \
-    ti/k3-am654-evm-hdmi.dtbo \
-    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
-    ti/k3-am654-evm-tc358876.dtbo \
-    ti/k3-am654-pcie-usb2.dtbo \
-    ti/k3-am654-pcie-usb3.dtbo \
-    ti/k3-am654-base-board-jailhouse.dtbo \
-    ti/k3-am654-evm-prupwm.dtbo \
 "
 
 BBMULTICONFIG += "k3r5-sr2"
-- 
2.17.1

