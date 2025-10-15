Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C0BCCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:01:02 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.14458.1760529655512899109
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 05:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rCIBmODR;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FC0q621395326;
	Wed, 15 Oct 2025 07:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760529652;
	bh=WNPPxWDLVSl2CcYgwt7lnV8+echoBB+7J+soBF53ND4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rCIBmODRuU8f9ZauXJcj+2c7elT7hy5IakNjzyhULiEgtP92daiHhLgUNQ7NtEoTM
	 1eqiemwS2SHVu7eXV3lG6B6EGrdBGU7MUBWKgnJ+Udp8WSN+AeytF/7qhTBT/8cyTh
	 tDg8QO0wSzZt03zGhsm4q+HtR3bxkfusnVYRd10g=
Received: from DLEE205.ent.ti.com (dlee205.ent.ti.com [157.170.170.85])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FC0qkO794768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 07:00:52 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 07:00:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 07:00:52 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FC0W7N1859032;
	Wed, 15 Oct 2025 07:00:49 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH v5 4/4] meta-ti-bsp: conf: machine: include: Build initramfs for all TI SoCs.
Date: Wed, 15 Oct 2025 17:30:32 +0530
Message-ID: <20251015120032.288741-5-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015120032.288741-1-m-shah@ti.com>
References: <20251015120032.288741-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 12:01:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19130

Trigger build for initramfs image and package it in the boot partition
of all TI SoC's whenever an image recipe is built with upstream
kernel(mainline or mainline-next).

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-soc.inc | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
index 1d18ceab..8d02cc79 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -28,4 +28,20 @@ CLASS_DEVICETREE_PREFIX = "${@ 'ti-devicetree-prefix' if d.getVar('KERNEL_DEVICE
 KERNEL_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
 IMAGE_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
 
-TI_INITRAMFS_KERNEL_MODULES ?= ""
\ No newline at end of file
+TI_INITRAMFS_KERNEL_MODULES ?= ""
+
+BUILD_CORE_INITRAMFS_IMAGE = "ti-core-initramfs"
+BUILD_CORE_INITRAMFS_IMAGE_FILE = "${BUILD_CORE_INITRAMFS_IMAGE}.cpio.xz"
+
+BUILD_CORE_INITRAMFS_IMAGE_STEP ?= ""
+BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-mainline = "${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"
+BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-next = "${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"
+
+do_image_wic[depends] += "${BUILD_CORE_INITRAMFS_IMAGE_STEP}"
+
+TI_WKS_INITRAMFS ?= ""
+TI_WKS_INITRAMFS:bsp-mainline = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
+TI_WKS_INITRAMFS:bsp-next = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
+
+IMAGE_BOOT_FILES:append:bsp-mainline = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
+IMAGE_BOOT_FILES:append:bsp-next = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
-- 
2.34.1


