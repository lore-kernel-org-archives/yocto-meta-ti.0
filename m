Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.4150.1645139631199508845
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 15:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=x+pqd3ky;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21HNDn0f093277;
	Thu, 17 Feb 2022 17:13:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645139629;
	bh=sDage1Sw19rEevpAMrNXzo7DabZUqBwwLM89napN0ic=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=x+pqd3kyLLxAp5WGpj0kPG8GKbgCO3skq9SzGsaku9WVbIwxl10ebQK3MawR+pbsa
	 MFiMWvL/V7sRiScrja0lVEGo4Le950Uc1AeSjLOxOKJ0nJIZVKgqngtV6Z6EKU/a98
	 5KDjI6L3Hi9ohkFkBajrjaYIQ4xZ4AKz+nnaeFSs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21HNDnD3085511
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Feb 2022 17:13:49 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 17
 Feb 2022 17:13:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 17 Feb 2022 17:13:48 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21HNDm5s031101;
	Thu, 17 Feb 2022 17:13:48 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nKpy8-0006nk-HG; Thu, 17 Feb 2022 17:13:48 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] ti-linux-fw: Bump to 08.02.00.003 release
Date: Thu, 17 Feb 2022 17:13:45 -0600
Message-ID: <20220217231348.26098-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220217231348.26098-1-reatmon@ti.com>
References: <20220217231348.26098-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the ti-linux-fw version for 08.02.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 7b28f153..fced78fd 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -24,7 +24,7 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "a0063e855414fd1609b5f63e2d765a49c8c513fe"
+K3_IMAGE_GEN_SRCREV ?= "f1db75bdc506287a9d04b0afbbb3d853a0948179"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
2.17.1

