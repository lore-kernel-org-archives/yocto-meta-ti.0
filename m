Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B543CCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 13:42:01 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.25681.1759239713824073096
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 06:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Jis2IlK3;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58UDfqfT2427409;
	Tue, 30 Sep 2025 08:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759239712;
	bh=YaZhGHJjj940gIwsvkAhBpYgCMaxdncSSuF64UjAXIE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jis2IlK31h8yOcHcE9tTwCu0SdlJMenlTJSUp2cLwQSoWv8gTseiVu7D0PNO4x2qd
	 k340iIVaHHbtNFgdUeOJ63VInfsct9U7Sc0bfi4R1fnwCcq0v/Vdp+dxWpKzEr7d4O
	 CHtsinREUzyK21Qkfjhx9vUdQAFpUr6Om/u8XpYc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58UDfqFT2723567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 30 Sep 2025 08:41:52 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 08:41:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 08:41:52 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58UDfWMC2988223;
	Tue, 30 Sep 2025 08:41:48 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH 4/4 v3] meta-ti-bsp: conf: machine: include: Build initramfs for all K3 platforms
Date: Tue, 30 Sep 2025 19:11:31 +0530
Message-ID: <20250930134131.1149453-5-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930134131.1149453-1-m-shah@ti.com>
References: <20250930134131.1149453-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 13:42:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19087

Trigger build for initramfs image and package it in the boot partition
of all K3 platforms whenever an image recipe is built with upstream
kernel(mainline or mainline-next).

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 50411a8e..69684a15 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -43,7 +43,12 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
-IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
+BUILD_CORE_INITRD_IMAGE ?= ""
+BUILD_CORE_INITRD_IMAGE:bsp-mainline = "ti-core-initramfs:do_image_complete"
+BUILD_CORE_INITRD_IMAGE:bsp-next = "ti-core-initramfs:do_image_complete"
+do_image_complete[depends] += "${BUILD_CORE_INITRD_IMAGE}"
+
+IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin ti-core-initramfs.cpio.xz"
 IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 
 EFI_PROVIDER ?= "grub-efi"
-- 
2.34.1


