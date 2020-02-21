Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.974.1582317309474370211
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 12:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tZc5/I26;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: angelabaker@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LKZ8Pr034681
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2020 14:35:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582317308;
	bh=vH/nlEI/FehDmD+weLgobiHZPJ0lXV6hoYwW5pgchw0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tZc5/I26MiJOnoDouF5MfLC9YdIN8FwCTZYfKBYk7jikGpJWFZ7wVKid+F77Qm7FF
	 4J3DVx3hMZitL0c29nmskuY1ihWJYCrnsA5Sys8c+nSKtzz+siCPfW22gOQk4HVdq1
	 V3GaT8hqxsDYkTeP3IKmdWDAHJTGBLk8e0XGnriw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LKZ8an062389
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2020 14:35:08 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 14:35:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 14:35:08 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LKZ8BO001743;
	Fri, 21 Feb 2020 14:35:08 -0600
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01LKZ8p07007;
	Fri, 21 Feb 2020 14:35:08 -0600 (CST)
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][zeus][PATCH 3/3] board-rtos: Update dependencies for am65xx-evm
Date: Fri, 21 Feb 2020 14:34:02 -0600
Message-ID: <1582317242-4035-3-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582317242-4035-1-git-send-email-angelabaker@ti.com>
References: <1582317242-4035-1-git-send-email-angelabaker@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
index 99530d1..dfbe20a 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -56,7 +56,6 @@ DEPENDS_append_dra7xx = " pm-lld-rtos \
 "
 
 DEPENDS_append_am65xx = " sciclient-rtos \
-                              pm-lld-rtos \
 "
 DEPENDS_append_j7-evm = " udma-lld-rtos \
                           sciclient-rtos \
-- 
1.9.1

