Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC64C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 06:06:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7735.1717653973183238161
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jun 2024 23:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zLFTGjB/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 456669jr019571;
	Thu, 6 Jun 2024 01:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717653969;
	bh=4bSgi6re7zmjfEPQNJHHt09Yj3uAwT6+rO6Y7PXf0CA=;
	h=From:To:CC:Subject:Date;
	b=zLFTGjB/ZYzZxsJZN5Gu19oDZbFsubxv9NocSnhQ2jX5P4Qu0rH3Wf0qFidEFOUN5
	 fqNhnnWty2eTdNMtMFKwNSbhEyKZziFPrafZcoungArxaQ+0tM2bh6mlXzs0YOk9IQ
	 B3y+uV/NNsiWhMhYhIpR1LupF8knPa/D/ec885lk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 456669dq083390
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jun 2024 01:06:09 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 01:06:08 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 01:06:08 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 456668bx010802;
	Thu, 6 Jun 2024 01:06:08 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>, Khasim <khasim@ti.com>,
        Praneeth <praneeth@ti.com>, Dhruva
	<d-gole@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: Switch beagleplay to TI baseline by default
Date: Thu, 6 Jun 2024 11:35:55 +0530
Message-ID: <20240606060555.1544271-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Jun 2024 06:06:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17699

- From LTS scarthgap, the beagleplay yocto machine will by
default build with TI baseline (i.e kernel 6.6 & U-Boot 2024.04 as of today).
Hence, remove all the references of bb.org from machine configuration file.

- Users can still build with Beagle's baseline (i.e. linux-bb.org & u-boot-bb.org)
by adding the following in their local.conf,

```
   PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
   PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
   PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
```

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 10 +---------
 meta-ti-bsp/conf/machine/beagleplay.conf      | 12 +++---------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
index 601cbbf7..b597c702 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -4,16 +4,8 @@
 
 require conf/machine/include/k3r5.inc
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
-
 SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
-
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
-UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_r5.config"
+UBOOT_MACHINE = "am62x_beagleplay_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index 65c14333..1420d439 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -2,7 +2,6 @@
 #@NAME: BeaglePlay (A53)
 #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
 
-require conf/machine//include/beagle.inc
 require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":am62xx"
 
@@ -18,15 +17,10 @@ TFA_K3_SYSTEM_SUSPEND = "1"
 
 OPTEEMACHINE = "k3-am62x"
 
-UBOOT_MACHINE = "am62x_evm_a53_defconfig"
+SPL_BINARY = "tispl.bin_unsigned"
+SPL_BINARYNAME = "tispl.bin"
 
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
-UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_a53.config"
-
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
+UBOOT_MACHINE = "am62x_beagleplay_a53_defconfig"
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625 \
-- 
2.34.1


