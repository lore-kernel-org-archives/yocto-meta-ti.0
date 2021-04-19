Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.1208.1618867005435945590
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 14:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wGVa6ny0;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGi9t042019;
	Mon, 19 Apr 2021 16:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618867004;
	bh=MJLPq++LXeqJrDfw8g9WBR92kU2eCxftq5htYRFmKHs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wGVa6ny0ex+naDpTwjF9T9Iia/sPO6CBgar7Rnoj+T4QT3YhNTu+czkiy30e5z6KJ
	 KD1HqKuenHA6mXDbLXdW8RA/DhZXD9sAY2p0OMm98EKB2BJUkmNf9RMwXmUn+isoPK
	 I2Mt/7QeeM8niZjhFjwznT2xw5XD7hQin38hAHbw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JLGiEo004705
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 16:16:44 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 19
 Apr 2021 16:16:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 19 Apr 2021 16:16:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGhkD050747;
	Mon, 19 Apr 2021 16:16:43 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v3 3/8] conf: am65xx-evm: Remove non-existent dtb* from 5.10
Date: Mon, 19 Apr 2021 16:16:38 -0500
Message-ID: <20210419211643.3942-4-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419211643.3942-1-praneeth@ti.com>
References: <20210419211643.3942-1-praneeth@ti.com>
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

