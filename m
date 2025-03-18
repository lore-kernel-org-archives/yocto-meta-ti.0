Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48355C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 02:38:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2812.1742265517397973015
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 19:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rQUVwAFg;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52I2caWq3004177
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742265516;
	bh=jquSLc3WHrJlkB+uEmE6+QNKc5JMCJcD0vwAxFo6D6s=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=rQUVwAFgxBwuKg3ng92OV9F6f1IXvD+KH2/PcsEK7O+EEcacL5g1BZinfpdN74oza
	 B3NWBGCmN6pTkxk8crjEqdWpp5+xoFAlWdvY7MuMc4Ns3wubNj1mAGACTju3uIabfh
	 fI1xWmsPMHPo4LwumBr4i5dbywQ9xzUNkYv/xTi0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52I2cakT023724
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:38:36 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 21:38:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 21:38:36 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52I2cae1043577
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:38:36 -0500
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH v5 2/3] conf: machine: am57xx-evm: Enable gc320 machine feature for am57xx
Date: Mon, 17 Mar 2025 21:38:35 -0500
Message-ID: <20250318023836.3507801-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318023836.3507801-1-a-christidis@ti.com>
References: <20250318023836.3507801-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Mar 2025 02:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18398

From: Antonios Christidis <a-christidis@ti.com>

MACHINE_FEATURE gc320, already gets set on omap-a15.inc. But ti-bsp.inc file,
removes the feature. So, remove that portion of functionality from ti-bsp, in
order to allow the building of gc320 in kernel 6.12.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v4:
- Instead of commenting out, remove both lines

 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 32beacee..054aa6cb 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -58,9 +58,6 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 = "24%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
 
-# GC320 support requires out-of-tree drivers not yet available in 6.12
-MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
-
 # ==========
 # ti-6_6
 # TI staging kernel 6.6, u-boot 2024.04
-- 
2.34.1


