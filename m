Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B506CCCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 12:23:40 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.21322.1759225523059909852
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 02:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=spiyxRXU;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: danishanwar@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58U9jMRD2428369
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 04:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759225522;
	bh=6RbmKzd5u46OqAa8oJS0pJ2LDU0HsdbLAZKci68TKUw=;
	h=From:To:CC:Subject:Date;
	b=spiyxRXUWiakkxFT2OWFFOC4/rKzCahvv4F7qUOysh+DrbuAwM27bnfjcB73mRr7z
	 Te61UcxqSi1V9uOtbHWr37Jios8ySLo/zErbEgyu7GBrSWRo0SHbQ3CZL/8s+g9XB5
	 XboPBowvh8cgMDDii74vqU/EVpVYbWaa1KtJxDYk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58U9jMTI2602069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 04:45:22 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 04:45:22 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 04:45:22 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58U9jM0Z2299938;
	Tue, 30 Sep 2025 04:45:22 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 58U9jLRv005197;
	Tue, 30 Sep 2025 04:45:21 -0500
From: "MD Danish Anwar" <danishanwar@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-malladi@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        MD Danish Anwar
	<danishanwar@ti.com>
Subject: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
Date: Tue, 30 Sep 2025 15:15:17 +0530
Message-ID: <20250930094517.2004652-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 12:23:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19079

AM64x supports PRP. Add pruprp-fw to AM64xx so that this can be packaged
for AM64xx

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 meta-ti-bsp/conf/machine/include/am64xx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 33fc6240..aa2dd1ec 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -28,6 +28,6 @@ TFA_BOARD = "lite"
 
 OPTEEMACHINE = "k3-am64x"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw pruprp-fw"
 
 TI_WKS_BOOTLOADER_APPEND = "console=ttyS2,115200n8"

base-commit: 9a30c7b97a979fa66cb22b2c2ce1d3b7d466ee24
-- 
2.34.1


