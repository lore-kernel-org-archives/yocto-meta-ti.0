Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34CEC3DA42
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 08:33:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.8299.1720513987900106103
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 01:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KTs8IvmP;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-vadapalli@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4698X6nE067575;
	Tue, 9 Jul 2024 03:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720513986;
	bh=PqAAf+NgSYDfKnmAxc3ydC0mUTZvELgSVjVB6Rw5U4k=;
	h=From:To:CC:Subject:Date;
	b=KTs8IvmPaACLzsl2LGNqqyWPxyvAvgfsWHmXHcw5fnQSRBSNX8coa4+nGVKIP8j+y
	 6EVu13p6A4bSRWMsK8oRifkgpwAdGYcWRI2nZ3e4qg8siZMlgsQp5sTzQUXo8vLXD8
	 WCeaj93ydjfqG+ssVdF60/MD9dJRqdRjzi+H2wP8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4698X6Ed013009
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2024 03:33:06 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jul 2024 03:33:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jul 2024 03:33:06 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4698X2mD030036;
	Tue, 9 Jul 2024 03:33:03 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <reatmon@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <danishanwar@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v4] conf: machine: am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
Date: Tue, 9 Jul 2024 14:03:02 +0530
Message-ID: <20240709083302.2499244-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 08:33:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17840

The config fragment "am62x_r5_usbdfu.config" is applicable to AM62x,
AM62x-SIP, AM62x-LP-EVM, AM62Ax and AM62Px devices and enables USB DFU boot
support at the R5 stage of boot.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Acked-by: Chirag Shilwant <c-shilwant@ti.com>
---
Hello, 

This patch is based on commit
f474b877 CI/CD Auto-Merger: cicd.scarthgap.202407082217
of scarthgap-next branch of meta-ti tree.

v3:
https://lore.kernel.org/r/20240708123653.2200919-1-s-vadapalli@ti.com
Changes since v3:
- Based on feedback from Ryan Eatmon <reatmon@ti.com> at:
  https://lore.kernel.org/r/390e677c-5027-4d0b-bf7c-78664ea12d88@ti.com/
  UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
  has been added to
  am62axx-evm-k3r5.conf, am62pxx-evm-k3r5.conf, am62xx-evm-k3r5.conf and
  am62xx-lp-evm-k3r5.conf
  while the order has been fixed in all files with the assignment
  UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
  preceding the override for bsp-ti-6_1.
- Collected Acked-by tag from Chirag Shilwant <c-shilwant@ti.com>
  as indicated at:
  https://lore.kernel.org/r/0b4fb757-2360-4b0a-b04c-ac31287bbdb3@ti.com/
  since Ryan's feedback has been addressed in this patch.

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

 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 2 ++
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   | 2 ++
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 2 ++
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 2 ++
 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 2 +-
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
index 2af3317e..370ae2f9 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -9,3 +9,5 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
index 36915381..2da09f5c 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -10,3 +10,5 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62px_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
index 548369ca..483de2e4 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -10,3 +10,5 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 52b69a72..1c3c5213 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -10,3 +10,5 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index 55bc530b..57ccbc15 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -11,5 +11,5 @@ SYSFW_SUFFIX = "hs-fs"
 UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
 
 UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
-
+UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
-- 
2.40.1


