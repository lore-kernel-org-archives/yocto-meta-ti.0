Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0A2E77173
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 18:31:14 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.19002.1733423473199168826
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 10:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hgGuQuub;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5IVCMj1795410
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Dec 2024 12:31:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733423472;
	bh=hSqZ6ex7ODF3OUssXWrQNo8eZR0L11T59YielH+TJ94=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hgGuQuubaOchq0vg+3/XuFN/5ptIVl0fZbi78tN0NHauGpDYSGD6zf7L7FXCwoFLC
	 RUNgoe+XEwryCV7RI5P+4tnvz37VgPv6/pdOwHmftFfnP5N9MkzB9U0M7VXWKlIBs1
	 +LljLoZwYa1UkYWpczQFRXZSAHbyTYNY73BT52Pg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5IVC8T122610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Dec 2024 12:31:12 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 12:31:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 12:31:11 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5IV6nk101183;
	Thu, 5 Dec 2024 12:31:10 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <b-padhi@ti.com>, <u-kumar1@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH 2/2] conf: machine: omap-a15.inc: include ipu1 firmware in the boot partition
Date: Thu, 5 Dec 2024 23:35:48 +0530
Message-ID: <20241205183103.3411587-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205183103.3411587-1-a-limaye@ti.com>
References: <20241205183103.3411587-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Dec 2024 18:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18083

Early Boot of remote processors is supported at the SPL stage of the
bootloader. Currently, SPL looks for the remoteproc firmwares in the
boot partition.

Therefore, add the rproc firmware to the boot partition of wic images.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index 6187f2ea..09ee3a6a 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -53,5 +53,6 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc3
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
+do_image_wic[depends] += "ti-ipc-rtos:do_deploy"
-- 
2.47.0


