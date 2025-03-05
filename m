Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723D7C3DA4A
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:52:55 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.18326.1741193569933534078
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 08:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qFJkKOXd;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525Gqn2O4009396
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:52:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741193569;
	bh=tdMlSuFisKxMSsVZn+XyKAp8N1wkdGFTNLl0DlvnuaM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qFJkKOXdcuHhrEnh7tUZIdgMvboZAfcBhqqq1KXLSqAkVgH2Ym5vvwShKSBtMIZpN
	 YI8sZqmTnz4q+RZ2xfKy4CdIx7YnBy994jwZxj6jXw99wms2VDCqTNjEzKcdXcpO/M
	 67O/48hECEQ70JZSBUZPY8iMmaHshsQqZE4L2e0E=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525GqnYc098535
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:52:49 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 10:52:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 10:52:48 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525GqmoI027729
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:52:48 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH v3 3/3] conf: machine: am57xx-evm : Enable gc320 machine feature for am57xx
Date: Wed, 5 Mar 2025 10:52:48 -0600
Message-ID: <20250305165248.354807-4-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305165248.354807-1-a-christidis@ti.com>
References: <20250305165248.354807-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Mar 2025 16:52:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18352

From: Antonios Christidis <a-christidis@ti.com>

MACHINE_FEATURE gc320 already gets set on omap-a15.inc. But ti-bsp.inc file,
removes the feature. So, remove that portion of functionality from ti-bsp, in
order to allow the building of gc320.

Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 32beacee..4f458d96 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -59,7 +59,7 @@ BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 = "24%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
 
 # GC320 support requires out-of-tree drivers not yet available in 6.12
-MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
+#MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
 
 # ==========
 # ti-6_6
-- 
2.34.1


