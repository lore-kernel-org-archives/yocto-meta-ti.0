Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1352C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 15:00:55 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.90199.1754060450959068022
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 08:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZYng/sBn;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571F0mDW3755577;
	Fri, 1 Aug 2025 10:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754060448;
	bh=R5N+rHUQvgOyMymcxS9M08ifDwMNKEdpIQSfKc+xtMc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZYng/sBnWIVJ1aBjmvfl+C0yESgnZzUkRrC+J60ceqnQjfMzhzWm0KaZVVyF4ONzx
	 YiofUCCQUE53kVX9nu4KX38dA0I8b/ak8KndWe6U3xGEyIKguW085t1sbgWRakwyW4
	 bVosoplEx9mogZgmCLw14XT0lqJMAifISUjFyjk0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571F0mvX621713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 10:00:48 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 10:00:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 10:00:47 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571F0bWT256132;
	Fri, 1 Aug 2025 10:00:45 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 3/5] conf: omap-a15.inc: Update package for wic dependency
Date: Fri, 1 Aug 2025 20:30:35 +0530
Message-ID: <20250801150037.2650736-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801150037.2650736-1-b-padhi@ti.com>
References: <20250801150037.2650736-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 15:00:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18881

The pre-built messageq IPC firmware is available in ti-linux-firmware
and packaged in ti-rtos-messageq-test-fw recipe in the meta-ti-bsp
layer. Update the dependency in machine conf to the above recipe. This
removes any dependency on meta-ti-extras layer.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index a258decd..f7b9d3ad 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -50,4 +50,4 @@ IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
-do_image_wic[depends] += "ti-ipc-rtos:do_deploy"
+do_image_wic[depends] += "ti-rtos-messageq-test-fw:do_deploy"
-- 
2.34.1


