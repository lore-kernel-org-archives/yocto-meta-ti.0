Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5976.1623110577023579202
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 17:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=te5rvBD4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15802trs086432;
	Mon, 7 Jun 2021 19:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623110575;
	bh=PfkPBXUUiPCyJ0zp9h0MHOXMB9DuOckbiV2kce1ElsA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=te5rvBD4OZVy8fVzEDjwBytUSYyAaDi4xOl9IYHzcD+svUNcdjGTjpbbT1phvdCb6
	 PumOQ64f/ksefiYLCzdCR85riJwDZfd+8/8i0Wr+dRLN8F9hvFG3Le9GC/7j1Da+9k
	 wf0MncF0082NRWbxUKK+u3qPM+wc/iaI9HInMQEw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15802tqj005426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Jun 2021 19:02:55 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 19:02:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 7 Jun 2021 19:02:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15802tPZ123509;
	Mon, 7 Jun 2021 19:02:55 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] conf: am65xx-evm: ReIntroduce display overlays for 5.10
Date: Mon, 7 Jun 2021 19:02:53 -0500
Message-ID: <20210608000254.12042-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608000254.12042-1-praneeth@ti.com>
References: <20210608000254.12042-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

commit 9ea50db095f9 ("conf: am65xx-evm: Remove non-existent dtb* from 5.10")
removed all non-existent dtb* for j7-evm as they were not
available on linux 5.10 branch at that time.

This patch reintroduces following display overlays.
- k3-am654-evm-tc358876.dtbo
- k3-am654-evm-oldi-lcd1evm.dtbo

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/am65xx.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 7cc3ddcc..8516ca4c 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -15,6 +15,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-sr1.dtbo \
     ti/k3-am654-pcie-usb2.dtbo \
     ti/k3-am654-pcie-usb3.dtbo \
+    ti/k3-am654-evm-tc358876.dtbo \
+    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
 "
 
 BBMULTICONFIG += "k3r5-sr2"
-- 
2.17.1

