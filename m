Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5272BCCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 11:50:38 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.31933.1759751432086604747
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 04:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IZkSBzeI;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596BoVcE3600722;
	Mon, 6 Oct 2025 06:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759751431;
	bh=jcbY8kSwZ/oapZ+OfRyZ27aj+nqQdo4MlAg1d7qiHTc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IZkSBzeI0IAqGwirdJvgQUoTh5TiErm0OjCuY0MmXUOKS15qVkzc0ISVRfQdciL4f
	 wlVVEMNlvmQaKnYKKFpGU5M7kBzJ72W7WIPNvR8oAXOseY1D78Xu+RDKS0Z8vJrmzb
	 SLFTx6Sw/oxp63VHIgoBZbooVyu9nkRM3aWnHQOs=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596BoV2m2204256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 6 Oct 2025 06:50:31 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 06:50:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 06:50:31 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596BoAwR3371433;
	Mon, 6 Oct 2025 06:50:27 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH v4 4/4] meta-ti-bsp: conf: machine: include: Build initramfs for all TI SoC's
Date: Mon, 6 Oct 2025 17:20:10 +0530
Message-ID: <20251006115010.1530509-5-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006115010.1530509-1-m-shah@ti.com>
References: <20251006115010.1530509-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Oct 2025 11:50:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19109

Trigger build for initramfs image and package it in the boot partition
of all TI SoC's whenever an image recipe is built with upstream
kernel(mainline or mainline-next).

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-soc.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
index 1d18ceab..68606cc4 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -28,4 +28,12 @@ CLASS_DEVICETREE_PREFIX = "${@ 'ti-devicetree-prefix' if d.getVar('KERNEL_DEVICE
 KERNEL_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
 IMAGE_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
 
-TI_INITRAMFS_KERNEL_MODULES ?= ""
\ No newline at end of file
+TI_INITRAMFS_KERNEL_MODULES ?= ""
+
+BUILD_CORE_INITRAMFS_IMAGE ?= ""
+BUILD_CORE_INITRAMFS_IMAGE:bsp-mainline = "ti-core-initramfs:do_image_complete"
+BUILD_CORE_INITRAMFS_IMAGE:bsp-next = "ti-core-initramfs:do_image_complete"
+do_image_complete[depends] += "${BUILD_CORE_INITRAMFS_IMAGE}"
+
+IMAGE_BOOT_FILES:append:bsp-mainline = " ti-core-initramfs.cpio.xz"
+IMAGE_BOOT_FILES:append:bsp-next = " ti-core-initramfs.cpio.xz"
\ No newline at end of file
-- 
2.34.1


