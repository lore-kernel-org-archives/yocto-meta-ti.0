Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC22EC369BD
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 03:35:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.682.1744860935662705944
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Apr 2025 20:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XFK/V0OX;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53H3ZWGI517529
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 22:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744860932;
	bh=BQAzo1Rh19lV+MQu/lA8VbCnHoh14+/6mYsVcfC8svY=;
	h=From:To:CC:Subject:Date;
	b=XFK/V0OXi6u5IkA1PWvU8iawNFFgyf4kQ+zX7MXGqSPAjJdjD2q5pDXf3pViWnoLm
	 Uu8FzRa2iCOTQcWect1TH2GOe2+/YAppxINvm/tE4oyfwfa0fL6Q6RTl5yInVDhPO7
	 lPpBAUamygmlg3bttGo89nWz9s69MCQJ+0w1VB2E=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53H3ZWCO098405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 22:35:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 22:35:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 22:35:31 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53H3ZV66056892;
	Wed, 16 Apr 2025 22:35:31 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: am62axx: Exclude tiboot3.bin for GP
Date: Thu, 17 Apr 2025 09:05:14 +0530
Message-ID: <20250417033514.3429633-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 03:35:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18477

* The GP variant of SK-AM62A-LP is no longer tested.
Hence, don't include it under IMAGE_BOOT_FILES to ensure
tiboot3-am62ax-gp-evm.bin is not packaged inside /boot
partition of wic image

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62axx.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index 98cea203..e5f827a9 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -10,9 +10,6 @@ TFA_K3_SYSTEM_SUSPEND = "1"
 # Default tiboot3.bin on AM62A is for HS-FS
 IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
 
-# Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
-IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
-
 # Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
 IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
 
-- 
2.34.1


