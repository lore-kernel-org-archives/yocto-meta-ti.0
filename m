Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81274C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 13:23:19 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.87524.1738588996432955130
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 05:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g137vwZq;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513DNFRt2198641
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 07:23:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738588995;
	bh=wxfxZRAiWjQcfjTu69QIfcWwYE+FLrHokBpN6c1kqCo=;
	h=From:To:CC:Subject:Date;
	b=g137vwZqczlPtr5gGBthirEhhErYm/gwYxfe7OSdUjnlL3gr1wpc/XFwrAPASjv3K
	 JZlpnqht5bVSHt4LKboirRETNRT+hLj6+IF5312FLcFGTS1cmLtySmfbtAeuRBeutH
	 df3JadGHn3Df041NncxjIB/ePBF40xuFBGdIA/Jc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513DNFnw005893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Feb 2025 07:23:15 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 07:23:14 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 07:23:15 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513DNChR100924;
	Mon, 3 Feb 2025 07:23:12 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>,
        <r-ravikumar@ti.com>, <s-sinha@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][scarthgap][PATCH] conf: machine: am69: Update filenames for initial bootloader tiboot3
Date: Mon, 3 Feb 2025 18:48:23 +0530
Message-ID: <20250203132307.2862016-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Feb 2025 13:23:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18242

Update the filenames for tiboot3.bin variants built by the u-boot recipe
and also the files expected by the wic image.

So far am69-sk and j784s4-evm have shared the same binman include file
and hence the same filenames for u-boot images. However, with the
configs and the devicetree being different, the same built binary does
not support both boards. Hence the filenames of images built for am69-sk
should reflect support for the same. The corresponding

This change is currently only applicable to ti-u-boot-2025.01, and hence
it is restricted to the override bsp-ti-6_12.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
This patch needs to be merged in sync with the corresponding patch for
ti-u-boot-2025.01.

The u-boot patch has also been posted to upstream u-boot and when merged
there, the next/upstream BSP packages will also need this change.
https://lore.kernel.org/u-boot/20250106-b4-upstream-j742s2-v2-2-42d6129ce333@ti.com/
---
 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 2 ++
 meta-ti-bsp/conf/machine/include/am69.inc  | 7 ++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
index 9d2b4cd6..376d8153 100644
--- a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
@@ -5,7 +5,9 @@
 require conf/machine/include/k3r5.inc
 
 SYSFW_SOC = "j784s4"
+SYSFW_SOC:bsp-ti-6_12 = "am69"
 SYSFW_CONFIG = "evm"
+SYSFW_CONFIG:bsp-ti-6_12 = "sk"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am69_sk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
index da8a5a8b..e82d58e2 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -9,10 +9,11 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
+# Add tiboot3.bin for all SOC types, to the wic image.
+BSP_BOOTLOADER_FILES = "tiboot3-j784s4-hs-fs-evm.bin tiboot3-j784s4-hs-evm.bin"
+BSP_BOOTLOADER_FILES:bsp-ti-6_12 = "tiboot3-am69-hs-fs-sk.bin tiboot3-am69-hs-sk.bin"
 
-# Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
+IMAGE_BOOT_FILES += "${BSP_BOOTLOADER_FILES}"
 
 TFA_BOARD = "j784s4"
 
-- 
2.48.1


