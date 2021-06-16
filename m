Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.829.1623887258263679888
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 16:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N11F8mQA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15GNlaqD096574;
	Wed, 16 Jun 2021 18:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623887256;
	bh=EoUqWqNIDRJXZ6KM+6nfEwk7HzolFuuBAaNV1GK01S4=;
	h=From:To:CC:Subject:Date;
	b=N11F8mQAuf9kvXyxSq+D3ZZtAZyhDck5ru5B5w+3LMvs3EsOm1qNA1ZuUmtagxAWV
	 wp0GtaQN+Xq3a97EzxJckGjGwKa4fhjL99z4OtyO02D0xnBHJQZ0lS3/tiCjvg7sT3
	 0uwVWzBFT+99bkpTkUwiP/IaC5JDCx/mzb+iIx9c=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15GNla4v053523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Jun 2021 18:47:36 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 16
 Jun 2021 18:47:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 16 Jun 2021 18:47:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15GNlaHQ130920;
	Wed, 16 Jun 2021 18:47:36 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-sci-fw: Update linux-firmware to latest
Date: Wed, 16 Jun 2021 18:47:36 -0500
Message-ID: <20210616234736.1200-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

update linux-firmware to latest which has sync from upstream linux-firmware main branch.

This commit also picks latest version of DisplayPort firmware v2.1.0
commit f99d6a1d579e ("linux-firmware: update firmware for mhdp8546")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index dbf63ef5..7ec074c8 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "2021.01a"
 
-SRCREV = "34062b5670aac524ce3074b184ef2ef62daafca0"
+SRCREV = "0468c7a78cd26f9190d374e198e37c63c7660ba9"
 BRANCH ?= "ti-linux-firmware"
 SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
 SRCREV_FORMAT = "imggen"
-- 
2.17.1

