Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1373.1624926381079969982
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 17:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=r7omVmif;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QJDW106926;
	Mon, 28 Jun 2021 19:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624926379;
	bh=Svy+1Gulz0ZQvG2dh6DksYV5hinTVeyLbzwFwEUR5YY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r7omVmifeR7WT0t8x7oVSO4SAYtRwZdgNBAlT96DWzzHsPzImLePKh6NQnxt9mSAK
	 PbeXhCw92Vfse7N200GAO2oo4CfCB+//TMt7JeVfUH7aqMum/49OOVHplzVuiQiP+O
	 VDK0jXzyMyq981fcrDNV2eSKLiYyf19pGOsno5m8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T0QJNi120898
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 19:26:19 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 19:26:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 19:26:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QIH8049527;
	Mon, 28 Jun 2021 19:26:18 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri <praneeth@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 1/4] ti-sci-fw: Update imggen to release 08.00.00.001 tag
Date: Tue, 29 Jun 2021 00:26:15 +0000
Message-ID: <20210629002618.29822-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629002618.29822-1-yogeshs@ti.com>
References: <20210629002618.29822-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 7ec074c8..e6227632 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -7,7 +7,7 @@ PV = "2021.01a"
 
 SRCREV = "0468c7a78cd26f9190d374e198e37c63c7660ba9"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
+SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

