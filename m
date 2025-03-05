Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EF9C282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 17:21:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.18952.1741195309321999217
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 09:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c76rEeg6;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525HLmFV3926577
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 11:21:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741195308;
	bh=NXg/AT+6ZDBA+NWk5YD4tUe0XoIxks2zLDHuD8ye5D8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=c76rEeg67LR3z2leAHSejocyTNqHimHMngD+MWvkBVFbOiCZdBXlXEUScnWv2abhN
	 gNxBS9MhJHrSRvxdVzzx52JhhSjuezhFI4uR/C+SXl3HIML8srTKAbSutrxjo2/cJ2
	 wsxqxVi4XsqCQC4Qw/IDyz3Xzs844RSII+jG6sF0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525HLm7M035605
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 11:21:48 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 11:21:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 11:21:48 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525HLmVQ064406
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 11:21:48 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH v4 3/3] conf: machine: am57xx-evm : Enable gc320 machine feature for am57xx
Date: Wed, 5 Mar 2025 11:21:48 -0600
Message-ID: <20250305172148.358549-4-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305172148.358549-1-a-christidis@ti.com>
References: <20250305172148.358549-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Mar 2025 17:21:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18357

From: Antonios Christidis <a-christidis@ti.com>

MACHINE_FEATURE gc320 already gets set on omap-a15.inc. But ti-bsp.inc file,
removes the feature. So, remove that portion of functionality from ti-bsp, in
order to allow the building of gc320.

Signed-Off-By: Antonios Christidis <a-christidis@ti.com>

v4:
- Instead of commenting out, remove the MACHINE_FEATURES line

---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 32beacee..cab6471a 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -58,8 +58,6 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 = "24%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
 
-# GC320 support requires out-of-tree drivers not yet available in 6.12
-MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
 
 # ==========
 # ti-6_6
-- 
2.34.1


