Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AA3C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 05:25:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.73365.1720416306242821417
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 07 Jul 2024 22:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pv4tQ1Xi;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-vadapalli@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4685P2GW007914;
	Mon, 8 Jul 2024 00:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720416302;
	bh=DOZEI1S1BcG+Hv4WYAWojxjlxT+MoyOFqF84sw5NPnI=;
	h=From:To:CC:Subject:Date;
	b=pv4tQ1XimtecDeN6tSVahxZWAp6MpcIhq78cdPoBc3cwX1MQtOjNY9ObBcd80CmZN
	 DgkolY/iYe0ZHyhtR88Q6YKa0oMZB0Fy4bcb6pQq7Hw1N4zB0W9prcILLt7DgANZow
	 kndIq63Btgtj4sjTCzEcYPKe3LkLRI5x3Ln/Pn2M=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4685P20Q075719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 00:25:02 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 00:25:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 00:25:01 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4685OwZn097230;
	Mon, 8 Jul 2024 00:24:59 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <reatmon@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <danishanwar@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [meta-ti][scarthgap][PATCH] conf: machine: am62*: apply config fragments for enabling USB DFU
Date: Mon, 8 Jul 2024 10:54:57 +0530
Message-ID: <20240708052457.1974547-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jul 2024 05:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17825

The config fragments "am62x_r5_usbdfu.config" and "am62x_a53_usbdfu.config"
are applicable to AM62x, AM62x-LP-EVM, AM62Ax and AM62Px devices and enable
USB DFU boot support at the R5 and A53 stages of boot respectively.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
ff9bf7b9 CI/CD Auto-Merger: cicd.scarthgap.202407071800
of scarthgap-next branch of meta-ti tree.

Regards,
Siddharth.

 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 1 +
 meta-ti-bsp/conf/machine/am62axx-evm.conf        | 1 +
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   | 1 +
 meta-ti-bsp/conf/machine/am62pxx-evm.conf        | 2 +-
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 1 +
 meta-ti-bsp/conf/machine/am62xx-evm.conf         | 1 +
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 1 +
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf      | 1 +
 8 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
index 2af3317e..5ba8c27e 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -9,3 +9,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index 238718d0..4d1b58db 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -16,3 +16,4 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_a53_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
index 36915381..9b68e626 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62px_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 8d94c2b4..36b13e73 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -23,6 +23,6 @@ UBOOT_MACHINE = "am62px_evm_a53_defconfig"
 # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
 # Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
-UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
+UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', 'am62x_a53_usbdfu.config', d)}"
 
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
index 548369ca..85c48334 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index fadbc6f4..5e1470b7 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -15,3 +15,4 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_a53_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 52b69a72..24f96858 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 51e99728..0bad3aed 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -18,3 +18,4 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_a53_usbdfu.config"
-- 
2.40.1


