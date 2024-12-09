Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9D9E77181
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 10:13:41 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.97818.1733739220156529150
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 02:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hfilYvyQ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9ADdFh2494420
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 04:13:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733739219;
	bh=IjzO3gOvHppzImL1ikegU7AmaxwJaZUsHtvq1onOwWw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hfilYvyQpLKsv88PC2fXhJyR4N3caqI/RnQxRT/QR1jDqM9mi4QfSWEc6Nd2j6JLk
	 wYlbc0at6cnNVCFiNyQJVAkIaNXk6xkXXeLHz22Vwt/y1Y2wKRfKAxM6IDCH8PwkTN
	 NraOpL3X5rZyYVLi2++utdiX2V2huFxH8Wg6gzBg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9ADdxP026578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 04:13:39 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 04:13:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 04:13:39 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9ADX07063363;
	Mon, 9 Dec 2024 04:13:37 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <b-padhi@ti.com>, <u-kumar1@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 2/2] conf: machine: omap-a15.inc: include ipu1 firmware in the boot partition
Date: Mon, 9 Dec 2024 15:40:35 +0530
Message-ID: <20241209101330.1893700-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209101330.1893700-1-a-limaye@ti.com>
References: <20241209101330.1893700-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Dec 2024 10:13:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18098

Early Boot of remote processors is supported at the SPL stage of the
bootloader. Currently, SPL looks for the remoteproc firmwares in the
boot partition.

Therefore, add the rproc firmware to the boot partition of wic images.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index be086936..a258decd 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -48,5 +48,6 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc3
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
+do_image_wic[depends] += "ti-ipc-rtos:do_deploy"
-- 
2.47.0


