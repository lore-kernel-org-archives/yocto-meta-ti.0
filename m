Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657FDC83000
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 17:17:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.21661.1750871837416910269
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 10:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Qk0H1CJG;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: anshuld@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PHHGVE1909862
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750871837;
	bh=hZCOaI/hWIedxYTcccT7rBOKolxc4u14Q0wFA0pRo1g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Qk0H1CJGM21skO+kQQbreJykLNEXYXbK86J6udoFf5n5UPxjcGho6FnlvbO8jufDD
	 UrB+2PCSf7T51YT4AKdbeknm9tjg9TH1K39+PERJCQgiSrDDY3PByUO/QbwLVCfB4W
	 8b776fshjqljhcy5U2X07rgt4PKEpibSacghqnPI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PHHG4d1191878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:16 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 12:17:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 12:17:16 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PHHFFe3748930;
	Wed, 25 Jun 2025 12:17:16 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v1 4/4] conf: machine: am62xxsip: update kernel dtbs
Date: Wed, 25 Jun 2025 22:46:24 +0530
Message-ID: <20250625171626.2863841-5-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625171626.2863841-1-anshuld@ti.com>
References: <20250625171626.2863841-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 17:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18674

The new kernel dtbs for am62x SiP have been merged to ti-linux-kernel as
of f9579207b081 ("arm64: dts: ti: Add support for AM6254xxl SiP SK") on
ti-linux-6.12.y-cicd.

Note that AM6254xxl is the OPN for am62x SiP and expands as follows:

AM6254XXL
     ||||
     |||+-- Feature Lookup (L indicates 512MiB of integrated LPDDR4)
     ||+--- Clock Speed
     |+---- Silicon PG Revision
     +----- Core configuration (4 indicates A53's in Quad core config)

This patch updates am62x SiP machine config to make use of the new dtbs.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 0a7ebec3..ccbb0200 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -10,10 +10,18 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
+    ti/k3-am6254xxl-sk.dtb \
+"
+KERNEL_DEVICETREE:bsp-ti-6_6 = " \
+    ti/k3-am625-sk.dtb \
+"
+KERNEL_DEVICETREE:bsp-ti-6_1 = " \
     ti/k3-am625-sk.dtb \
 "
 
-FIT_CONF_DEFAULT_DTB = "ti/k3-am625-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am6254xxl-sk.dtb"
+FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 = "ti/k3-am625-sk.dtb"
+FIT_CONF_DEFAULT_DTB:bsp-ti-6_1 = "ti/k3-am625-sk.dtb"
 
 UBOOT_MACHINE = "am6254xxl_evm_a53_defconfig"
 
-- 
2.49.0


