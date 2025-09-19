Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176D5CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 09:39:06 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.12491.1758274735704792985
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 02:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IrXfWnY0;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58J9crNd685182;
	Fri, 19 Sep 2025 04:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758274733;
	bh=rSgKv1+B7Rtn0FD1Ha7pn5d/W6BWSZJqmV1jAvbepAs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IrXfWnY0V6gF6xeYuJj6a44bIVFOgn2h7ZcdFglYAmEoRSHPQ2Xp5wF8pHqZh0Oxj
	 D8ISiN1WEW78FdIZqI1Ym40hHkFm6ut5KW301m3mNQw9NZLFmN8ieiGh97xeNLQUMQ
	 /cluM69bGSahAFchdun5RI9lVFYmDfuFAYNN8fOA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58J9crba2805535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 19 Sep 2025 04:38:53 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 04:38:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 04:38:53 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58J9cWHk2367778;
	Fri, 19 Sep 2025 04:38:49 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH 4/4 v2] meta-ti-bsp: conf: machine: include: Build initrd for all K3 platforms
Date: Fri, 19 Sep 2025 15:08:31 +0530
Message-ID: <20250919093831.20609-5-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919093831.20609-1-m-shah@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Sep 2025 09:39:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19047

Trigger build for initramfs image and package it in the boot partition
of all K3 platforms whenever an image recipe is built with upstream
kernel(mainline or mainline-next).

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 50411a8e..c0c49e0d 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -33,6 +33,8 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-image ti-kernel-fitimage"
 
 TFA_PLATFORM = "k3"
 
+BUILD_INITRD_IMAGE = ""
+
 # Use the expected value of the ubifs filesystem's volume name in the kernel
 # and u-boot.
 UBI_VOLNAME = "rootfs"
@@ -43,7 +45,11 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
-IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
+BUILD_INITRD_IMAGE:bsp-mainline = "ti-initrd-image:do_image_complete"
+BUILD_INITRD_IMAGE:bsp-next = "ti-initrd-image:do_image_complete"
+do_image_complete[depends] += "${BUILD_INITRD_IMAGE}"
+
+IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin initrd.cpio.xz"
 IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 
 EFI_PROVIDER ?= "grub-efi"
-- 
2.34.1


