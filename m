Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020E0C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 08:56:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6711.1718182586246215041
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Jun 2024 01:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nCSvFcj8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45C8uP1c038356
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Jun 2024 03:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718182585;
	bh=SBELn9hFbWLZQnwmRC8s6SBYhuH1jlMmLSHzccbvGJY=;
	h=From:To:CC:Subject:Date;
	b=nCSvFcj8T5KzkZarZmVTmKO7d7a8voVcpyR5XQXtYgR0HIiT961JSN9PV//fgNxkA
	 6wihJnxQCmkQqpLf66XCEi8uJ3KT+xGWO0DWttVXbK0kwLnTBqTcQtHbD93DDxamE6
	 4AKkAPY1sLgqRTMnCZFgXwAopNfE6jASKJHSid78=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45C8uPZ1023425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Jun 2024 03:56:25 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Jun 2024 03:56:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Jun 2024 03:56:24 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45C8uOoX023641;
	Wed, 12 Jun 2024 03:56:24 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>,
        Venkat
	<v-krishnamoorthy@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] meta-ti-bsp: ti-rtos-bin: Drop references of am62-main-r5f0_0-fw
Date: Wed, 12 Jun 2024 14:26:17 +0530
Message-ID: <20240612085617.3460823-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Jun 2024 08:56:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17718

- Under ti-ipc, ti-linux-firmware repository never had a R5 firmware for AM62x [1]
It only contains `am62-mcu-m4f0_0-fw` since AM62x firmwares were initially added [2]

- Hence, remove this faulty code that used to create a R5 firmware symlink under /lib/firmware/
that ultimately used to point to the same M4 firmware under /lib/firmware/ti-ipc/am62xx/ of filesystem.

[1]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-ipc/am62xx?h=ti-linux-firmware

[2]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=c2e5d59c706969a9faf1f31350b32be67a20298d

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 7bf5030a..a67dc18e 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -127,7 +127,6 @@ ALTERNATIVE:${PN}:am64xx = "\
 
 ALTERNATIVE:${PN}:am62xx = "\
                     am62-mcu-m4f0_0-fw    am62-mcu-m4f0_0-fw-sec \
-                    am62-main-r5f0_0-fw   am62-main-r5f0_0-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:am62pxx = "\
@@ -207,8 +206,6 @@ ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw-sec] = "${nonarch_base_libdir}/firmware
 
 ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62-mcu-m4f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62-mcu-m4f0_0-fw-sec"
-ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw-sec"
 
 ALTERNATIVE_LINK_NAME[am62p-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62p-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62p-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62p-mcu-r5f0_0-fw-sec"
@@ -309,8 +306,6 @@ ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW
 
 ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
-ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[am62-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
 
 ALTERNATIVE_TARGET[am62p-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[am62p-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
-- 
2.34.1


