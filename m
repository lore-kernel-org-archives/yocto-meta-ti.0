Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F35C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:05:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.30545.1754499894448824792
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ORFDKIW4;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576H4rRh127426;
	Wed, 6 Aug 2025 12:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754499893;
	bh=qYGC6DqJtF/Gib+yz6MhFO3CsvRbIUZ/xR60WliYgr0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ORFDKIW4BaG8GUqFVjcGlgg+DyMp3Kwa5XlvOwF+5RUM8R2xZC0viPF9q3kdVXNIy
	 Y9J0vKqpecPkrhMSu9aaBYXs1HKfxye0SSTcv8NfLhbcJO+9EqFTXeM3mZ5e2MWwvH
	 joexY1nm3nxYCGwHoydelTgVd2HE9MC+08nsyTgA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576H4rmH3237928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:04:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:04:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:04:52 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576H4gP73869168;
	Wed, 6 Aug 2025 12:04:50 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v2 3/5] conf: omap-a15.inc: Update package for wic dependency
Date: Wed, 6 Aug 2025 22:34:40 +0530
Message-ID: <20250806170442.243461-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806170442.243461-1-b-padhi@ti.com>
References: <20250806170442.243461-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18899

The pre-built messageq IPC firmware is available in ti-linux-firmware
and packaged in ti-rtos-messageq-test-fw recipe in the meta-ti-bsp
layer. Update the dependency in machine conf to the above recipe. This
removes any dependency on meta-ti-extras layer.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index 3b8eb0fd..2179476f 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -48,4 +48,4 @@ IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
-do_image_wic[depends] += "ti-ipc-rtos:do_deploy"
+do_image_wic[depends] += "ti-rtos-messageq-test-fw:do_deploy"
-- 
2.34.1


