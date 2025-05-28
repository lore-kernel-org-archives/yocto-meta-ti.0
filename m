Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48840C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 10:27:07 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.12463.1748428024550814088
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 May 2025 03:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BQHTMRa1;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54SAR0pb2067806;
	Wed, 28 May 2025 05:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748428020;
	bh=bwAEBjp9hrJe3TRyDCtg2188KRgBbHaNVIiRtoaY/NM=;
	h=From:To:CC:Subject:Date;
	b=BQHTMRa1h5OxoRlIZoBiIJS4F+Zf7yq16ZZvWNSneqeIrK3s0GX8I1v2Tn5IIGFJ+
	 sf0zNnTAo/oWQEXUqj6r3ySB7qyDIl4kcDuTNsztVjaNc7E4SfTn6P+wB15mHGT5d8
	 RxHqVc/TKSx9y09GUbEF0/lLzzNsEMcGAsYgUEYg=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54SAR0qg3543825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 28 May 2025 05:27:00 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 May 2025 05:27:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 May 2025 05:27:00 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54SAQxC1053242;
	Wed, 28 May 2025 05:26:59 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [scarthgap][PATCH 1/2] meta-ti-bsp: conf: Package overlay for am62dxx-evm
Date: Wed, 28 May 2025 15:56:52 +0530
Message-ID: <20250528102653.323423-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 May 2025 10:27:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18601

Package k3-am62a7-sk-edgeai.dtso for am62dxx-evm image. This overlay is
required for audio analytics for am62dxx-evm.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
index f2da559c..9fbbb90a 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -6,6 +6,7 @@ require conf/machine/include/am62dxx.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62d2 \
+    ti/k3-am62a7-sk-edgeai \
 "
 
 KERNEL_DEVICETREE = ""
-- 
2.34.1


