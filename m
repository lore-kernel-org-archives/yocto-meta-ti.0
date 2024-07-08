Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9CFC3DA42
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 12:37:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.78650.1720442221451559535
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 05:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ed6cXgsW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-vadapalli@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468CavW3122108;
	Mon, 8 Jul 2024 07:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720442217;
	bh=Ugi+cL0gSBJiarYWi7d5HwcmiP8+giv1fCgf+D2ayG8=;
	h=From:To:CC:Subject:Date;
	b=ed6cXgsWR/yLxzrRMmY8Q0iRGq2cNerJB12uYqgNrGckXddupvAIVFf6dNPrpbbta
	 dUxVzycAMBs4cYPieHkR4pQc07vo/A/IlXQoYc+UcA693jh+Elr+hVahQ9mBNiJ5/3
	 iT8vrfHmT7M20Njnf88gGYwkSD5L618bdfTf1agQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468Cavw5039403
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 07:36:57 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 07:36:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 07:36:57 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468Cas1n038226;
	Mon, 8 Jul 2024 07:36:54 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <reatmon@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <danishanwar@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v3] conf: machine: am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
Date: Mon, 8 Jul 2024 18:06:53 +0530
Message-ID: <20240708123653.2200919-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jul 2024 12:37:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17832

The config fragment "am62x_r5_usbdfu.config" is applicable to AM62x,
AM62x-SIP, AM62x-LP-EVM, AM62Ax and AM62Px devices and enables USB DFU boot
support at the R5 stage of boot.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello, 

This patch is based on commit
ff9bf7b9 CI/CD Auto-Merger: cicd.scarthgap.202407071800
of scarthgap-next branch of meta-ti tree.

v2:
https://lore.kernel.org/r/20240708060054.1985156-1-s-vadapalli@ti.com/
Changes since v2:
- Based on feedback from Chirag Shilwant <c-shilwant@ti.com> at:
  https://lore.kernel.org/r/32db66e5-730c-42ec-9145-72abdf35b6d1@ti.com/
  the subject-prefix has been updated to master/scarthgap and the config
  fragment for USB DFU is being applied to AM62x SIP as well.

v1:
https://lore.kernel.org/r/20240708052457.1974547-1-s-vadapalli@ti.com/
Changes since v1:
- As pointed out by Vignesh Raghavendra <vigneshr@ti.com> at:
  https://lore.kernel.org/r/829dc5b5-e87c-4679-9e2d-7417c744a9c9@ti.com/
  the A53 defconfigs already include the "am62x_a53_usbdfu.config" config
  fragment. Hence, they are not required in the am62*-evm.conf files and
  have been dropped in this patch.
- Commit message has been updated accordingly.

Regards,
Siddharth.

 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 1 +
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   | 1 +
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 1 +
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 1 +
 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 1 +
 5 files changed, 5 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
index 2af3317e..5ba8c27e 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -9,3 +9,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
index 36915381..9b68e626 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62px_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
index 548369ca..85c48334 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 52b69a72..24f96858 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index 55bc530b..b6045d89 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -13,3 +13,4 @@ UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
 
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
-- 
2.40.1


