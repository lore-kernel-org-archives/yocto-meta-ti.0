Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644DAC25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:01:43 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9475.1716382900113699229
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 May 2024 06:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TdMhHd2U;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44MD1Xre120268;
	Wed, 22 May 2024 08:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716382893;
	bh=ZYatIwBuwDPRGngrSZo89y8NRXKss45y93nAtwrDWWc=;
	h=From:To:CC:Subject:Date;
	b=TdMhHd2Uy1HLOcsedG951xWRq6Jbl8TQdFNylodREhwgFtxUn36Yr1DwmThyMWRLw
	 iRokodX8jvaUsbHmiPzHGOP1xDUtmcqLO87jD+ZbqEeB7aoo+n5ubSUmDXjJxmLOMF
	 hf0zBPQhlllxWA0nEpRWN+dkX2/bzxxd9jF1yIYQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44MD1X6B105157
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 08:01:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 08:01:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 08:01:33 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44MD1W2x082645;
	Wed, 22 May 2024 08:01:32 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Praneeth <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: Update UBOOT_MACHINE for am62xx-lp-evm
Date: Wed, 22 May 2024 18:30:57 +0530
Message-ID: <20240522130057.1346796-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 13:01:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17670

Modify the U-Boot defconfig names for A53 and R5
machine configurations based on ti-u-boot-2024.04 [1]

[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2024.04&id=781b6a4a9ffde2428484d5c061b80e6c192b2049

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 52b69a72..ddcd79c4 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -9,4 +9,4 @@ SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
-UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
+UBOOT_MACHINE = "am62x_lp_sk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 51e99728..9ffb9898 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -17,4 +17,4 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62-lp-sk.dtb \
 "
 
-UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
+UBOOT_MACHINE = "am62x_lp_sk_a53_defconfig"
-- 
2.34.1


