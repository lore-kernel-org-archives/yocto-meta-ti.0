Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.2506.1646431202076553322
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 14:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VquPIxOt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 224LxxlZ010632;
	Fri, 4 Mar 2022 15:59:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646431199;
	bh=UOYnN8gwJ0UD/RgoP1RlGLYE8aC0V0DrowJfW0095FE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VquPIxOtUisGM/YdTs6Mn84UPntoIXKdWiHZaYDEu574dmwTRR6J4AlqUrIvQgESX
	 1HqmMHOwV0GGRIsR7JYRXd4iyixniY6MZzEmtmpak7LdQxcyy6uSCfTZx4yCXQNUaG
	 HIYPvYVhnp2QEYCWCooDLHw/zCBy2RfRqvP6NKc4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 224LxxmM013892
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 15:59:59 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 15:59:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 15:59:59 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 224LxxTn076453;
	Fri, 4 Mar 2022 15:59:59 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nQFxu-00031f-WD; Fri, 04 Mar 2022 15:59:59 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] ti-linux-fw: Bump to 08.02.00.005 release
Date: Fri, 4 Mar 2022 15:59:58 -0600
Message-ID: <20220304215958.11568-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220304215958.11568-1-reatmon@ti.com>
References: <20220304215958.11568-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the ti-linux-fw version for 08.02.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index fced78fd..faf998dd 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -19,7 +19,7 @@ CADENCE_MHDP_FW_VERSION = "1.2.17"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 
-TI_LINUX_FW_SRCREV ?= "8810faf0c51a80554150e185122e43bee1553c37"
+TI_LINUX_FW_SRCREV ?= "0f4905088d24e474063f33777559149e11538be5"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-- 
2.17.1

