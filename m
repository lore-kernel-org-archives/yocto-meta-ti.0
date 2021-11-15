Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.247.1636996693821372156
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 09:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H8T08OTz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFHICkd013632;
	Mon, 15 Nov 2021 11:18:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636996692;
	bh=03Zvx2wLanBL7qY0k84VaN1CIXirPtTMrnV8UUSqZxs=;
	h=From:To:Subject:Date;
	b=H8T08OTzq5mJuFFnBt47VYqZbO0k0L2m2P5trwV6e07yctEUfH2o0kCiHywFABN/M
	 orFtQrHHTefYcc9/OsiZD8HyVTC9caIAd6eEkPkJJC6DppMuZUc69tMdf1veiezs5r
	 ni+8rGY3D/6qj9q7kcsYzAZm4K8nf6ml8yceEnok=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFHIBEZ080618
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Nov 2021 11:18:12 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 11:18:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 11:18:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFHIBqG019333;
	Mon, 15 Nov 2021 11:18:11 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/2] conf: machine: am64xx: Add missing dtbo
Date: Mon, 15 Nov 2021 17:18:10 +0000
Message-ID: <20211115171811.34908-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add missing k3-am642-evm-nand.dtbo required for system test

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/include/am64xx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 95fdc79d..7646c70a 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -10,6 +10,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
     ti/k3-am642-sk.dtb \
     ti/k3-am642-evm-icssg1-dualemac.dtbo \
+    ti/k3-am642-evm-nand.dtbo \
 "
 
 # AM64 supports multi-certificate images, use the same
-- 
2.17.1

