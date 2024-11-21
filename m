Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E32D7877D
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 15:11:59 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.582.1732201910754250930
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 07:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yOpwuFsw;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4ALFBnfQ028075
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Nov 2024 09:11:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732201909;
	bh=VTZM32oseR162jdZ+F7m5b/UjPRz5wsdln+y1+hNCMM=;
	h=From:To:CC:Subject:Date;
	b=yOpwuFsw2ZdAEl4EWC1k5w5nd6PGtmUcBWq5pf6KbU0ZikFAVTFecEctrkhcjTLwg
	 rCa4IdvsV2y/wUoCM6ZO8Nhk0ewpaLcYQck1E4rsgi71CJNjW46djZWr2fvoH7lYz9
	 nYtEyQ4E/YyV0RyN/LN8WCBtWL8fQ4txOMQFzCNo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ALFBnxL021791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Nov 2024 09:11:49 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Nov 2024 09:11:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Nov 2024 09:11:48 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALFBmcO094838;
	Thu, 21 Nov 2024 09:11:48 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <vigneshr@ti.com>,
        <r-donadkar@ti.com>, <s-jain1@ti.com>, <c-shilwant@ti.com>
Subject: [meta-ti] [scarthgap/master] [PATCH] conf: machine: am62pxx: Pick overlays for V3Link cameras
Date: Thu, 21 Nov 2024 20:41:47 +0530
Message-ID: <20241121151147.1920885-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Nov 2024 15:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18073

From: Rishikesh Donadkar <r-donadkar@ti.com>

The V3Link camera fusion board [1] can be used to connect upto 4
OV5640 sensors to SK-AM62A.

Overlays for interfacing OV5640 sensor with V3Link are built
as part of the TI linux kernel. Pick these in the BSP filesystem.

[1]: https://www.arducam.com/product/arducam-v3link-camera-kit-for-ti-development-boards/

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 676e64a40d99..bb3c34a3f9b8 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -10,6 +10,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62x-sk-csi2 \
     ti/k3-am62x-sk-hdmi \
     ti/k3-am62x-sk-lpm \
+    ti/k3-v3link \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.39.1


