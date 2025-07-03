Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37DBC77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 08:56:34 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.17811.1751532988166654203
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 01:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QCl8D0Rt;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: anshuld@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5638uRSV3850481
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Jul 2025 03:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751532987;
	bh=8LylLcxbbWO2y59vik8px72ujh1Eh+r+4an0Cr20HcY=;
	h=From:To:CC:Subject:Date;
	b=QCl8D0RtNHonjB0ioLE2xcTcKZMUnKi4HcXu0Zcor+kTi3iXgMf7IsbkizqlEV0Dd
	 wo/WEJWYTaE6k51ObmHizEXw+dfTbK656xpUvQU4l3Mt8oy1HrKr73bMh0VfRB46DA
	 c3SdXfQlTdLjg4U5eppsPkk4HFOcqXAaxbDTftq4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5638uRS81684062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Jul 2025 03:56:27 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 03:56:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 03:56:27 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5638uQER834164;
	Thu, 3 Jul 2025 03:56:26 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v1 1/2] conf: machine: update config fragment for ti-falcon
Date: Thu, 3 Jul 2025 14:25:40 +0530
Message-ID: <20250703085542.3246605-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 03 Jul 2025 08:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18762

The U-Boot config fragment used to enable falcon mode was renamed from
'am62x_r5_falcon.config' to the more generic 'k3_r5_falcon.config' when
adapting upstream patches to ti-u-boot[1].

Therefore this patch fixes the same in meta-ti.

[1]: 90d2e960b4c at ti-u-boot-2025.01-next

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 2 +-
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   | 2 +-
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 2 +-
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
index ab14feef..7abe706e 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -10,4 +10,4 @@ SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:ti-falcon = "am62x_r5_falcon.config"
+UBOOT_CONFIG_FRAGMENTS:ti-falcon = "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
index 849d6625..28378209 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -11,4 +11,4 @@ SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62px_evm_r5_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:ti-falcon = "am62x_r5_falcon.config"
+UBOOT_CONFIG_FRAGMENTS:ti-falcon = "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
index a624a35d..5c5b133f 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -11,4 +11,4 @@ SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:ti-falcon = "am62x_r5_falcon.config"
+UBOOT_CONFIG_FRAGMENTS:ti-falcon = "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 851935db..7203ebf7 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -11,4 +11,4 @@ SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:ti-falcon = "am62x_r5_falcon.config"
+UBOOT_CONFIG_FRAGMENTS:ti-falcon = "k3_r5_falcon.config"
-- 
2.49.0


