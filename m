Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.4896.1618549567000285380
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 22:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YwTbfDZ6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13G565pe095402;
	Fri, 16 Apr 2021 00:06:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618549565;
	bh=MJLPq++LXeqJrDfw8g9WBR92kU2eCxftq5htYRFmKHs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YwTbfDZ6mbHTMzMDufygrqYj1l4v10FospC+6lCDKgSKJLn0aQ8ctA0hb4U5z8rjy
	 y1D/+Y/y1QHKAg86vVwxRP469yN/mGalarz9YL8d00smHeGRUj1IjgXMc1Mvfs59Sh
	 h0nEIfR0YSIPoDcv4UbRkUfowB8PkZ+ghLY2JQuw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13G565Cq086128
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 00:06:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Apr 2021 00:06:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Apr 2021 00:06:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13G564VL064062;
	Fri, 16 Apr 2021 00:06:05 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2 3/6] conf: am65xx-evm: Remove non-existent dtb* from 5.10
Date: Fri, 16 Apr 2021 00:05:57 -0500
Message-ID: <20210416050600.16593-4-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416050600.16593-1-praneeth@ti.com>
References: <20210416050600.16593-1-praneeth@ti.com>
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

