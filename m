Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0FCC021A5
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 20:18:39 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.26465.1739391511332213774
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 12:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F95xcvQU;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CKIUve597655
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 14:18:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739391510;
	bh=n3bFiPRQO3sT8KBDHscniRwVFjdDH1M7Vvm7dl1QJ7Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=F95xcvQUq2iZ/U3iXwi2oxluffSCrAyX5xgYt91bNp8Q+2NrS5uNjRh8wxtgmpMFE
	 eB8Eu1Ql975tkN6H4uJ0UbjcLAdlYaZNBHOiWdijxj9IGHLkmFkqf1d0v7lbCbEYKq
	 g43xXi2jOSrfSNjUGZ+icmBbt6YQmgndSY1gQd0M=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CKIUBI091963
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 14:18:30 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 14:18:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 14:18:30 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CKIUdG049546
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 14:18:30 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH 3/3] conf: machine: am57xx-evm : Enable gc320 machine feature for am57xx
Date: Wed, 12 Feb 2025 14:18:30 -0600
Message-ID: <20250212201830.2090247-4-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212201830.2090247-1-a-christidis@ti.com>
References: <20250212201830.2090247-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 20:18:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18304

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

MACHINE_FEATURE gc320 already gets set on omap-a15.inc. But ti-bsp.inc file,
removes the feature. So, remove that portion of functionality from ti-bsp, in
order to allow the building of gc320.

Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 7c8466c4..c3bdbcf8 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -54,9 +54,6 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
 # in 6.12 yet
 MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
 
-# GC320 support requires out-of-tree drivers not yet available in 6.12
-MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
-
 # ==========
 # ti-6_6
 # TI staging kernel 6.6, u-boot 2024.04
-- 
2.34.1


