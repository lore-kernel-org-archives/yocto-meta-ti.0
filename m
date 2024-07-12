Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D1BC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 12:16:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6270.1720786570100333046
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Jul 2024 05:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DcJcFa+U;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46CCG5CL006531;
	Fri, 12 Jul 2024 07:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720786565;
	bh=bgy8gJeNjgqWi9CZAL1ohwE9OxOE23R66meCUnEs+wY=;
	h=From:To:Subject:Date;
	b=DcJcFa+UfCsfJdT5OM13IS8BZNLxa+kDMG9y2tvYR2Ghs3d822fhIlPMDpHilOgRM
	 qtvixomGTdmgVoMienTCdWa9vGg3NY8RCvxGIP8NCD/XW6qSotZTCulp5LCgP/04Qg
	 0NQVuJSxeYNlw0u1U6YpYgMwbRYTn/xIXCvOGOlM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46CCG5xA088244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Jul 2024 07:16:05 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Jul 2024 07:16:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Jul 2024 07:16:05 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46CCG5b1099140;
	Fri, 12 Jul 2024 07:16:05 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sSFC1-0003VJ-Ar; Fri, 12 Jul 2024 07:16:05 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] Revert "conf: machine: am62*-evm-k3r5.conf: apply fragment for enabling USB DFU"
Date: Fri, 12 Jul 2024 07:16:05 -0500
Message-ID: <20240712121605.13430-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Jul 2024 12:16:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17860

This reverts commit fa94effc26a8678a5400291a3ca0ef1000eea7b1.

There are boot issues with SD card booting with this change.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 2 --
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   | 2 --
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 2 --
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 2 --
 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 2 +-
 5 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
index 370ae2f9..2af3317e 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -9,5 +9,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
index 2da09f5c..36915381 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -10,5 +10,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62px_evm_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
index 483de2e4..548369ca 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -10,5 +10,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 1c3c5213..52b69a72 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -10,5 +10,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index 57ccbc15..55bc530b 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -11,5 +11,5 @@ SYSFW_SUFFIX = "hs-fs"
 UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
 
 UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
-UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
+
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
-- 
2.17.1


