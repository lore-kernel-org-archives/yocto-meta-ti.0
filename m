Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5923C02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 22:52:29 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.31794.1736808744877455702
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 14:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OSbVRO5n;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50DMqNYF031525;
	Mon, 13 Jan 2025 16:52:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736808743;
	bh=SMWSmmpZ6ypOTVNOwjt5MPmEqKNyJXbMEqVchaoHWCg=;
	h=From:To:Subject:Date;
	b=OSbVRO5np0vrbDlW0NhPj3MHqowceqdZ5UUu8+rHrb7ckOcVbm0Jn2wAk2iKjhs/A
	 1QU3thsJ50S/DuWj7qx1WxhRpO1g3dWpHHffdu5cnbVXgENkLycKMy7mIuLYpM+RvU
	 5z2V0wdR7MGxskSdWrYrs6s4yrmPeqXhRYEQS2rg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMqNjU084924
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 16:52:23 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 16:52:22 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 16:52:22 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DMqMbT044981;
	Mon, 13 Jan 2025 16:52:22 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tXTIE-0003YR-IO; Mon, 13 Jan 2025 16:52:22 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 1/2] conf: machine: beagleplay*: Update defaults to mainline
Date: Mon, 13 Jan 2025 16:52:21 -0600
Message-ID: <20250113225222.13622-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Jan 2025 22:52:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18191

The defaults for UBOOT_MACHINE and SPL_BINARY are now aligned with the
mainline values and new ti-6_1 values for the previous defaults were
created to capture those.  Also updated the meta-beagle beagleplay since
it inherits the beagleplay-ti settings.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/conf/machine/beagleplay-k3r5.conf    | 2 +-
 meta-beagle/conf/machine/beagleplay.conf         | 5 +----
 meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf | 6 ++----
 meta-ti-bsp/conf/machine/beagleplay-ti.conf      | 9 +++------
 4 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/meta-beagle/conf/machine/beagleplay-k3r5.conf b/meta-beagle/conf/machine/beagleplay-k3r5.conf
index 3e7f0c1b..f053c11e 100644
--- a/meta-beagle/conf/machine/beagleplay-k3r5.conf
+++ b/meta-beagle/conf/machine/beagleplay-k3r5.conf
@@ -6,6 +6,6 @@ require conf/machine/beagleplay-ti-k3r5.conf
 
 require conf/machine/include/beagle-bsp.inc
 
-UBOOT_MACHINE:bsp-bb_org-6_6 = "am62x_beagleplay_r5_defconfig"
+UBOOT_MACHINE:bsp-bb_org-6_1 = "am62x_evm_r5_defconfig"
 
 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_r5.config"
diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/machine/beagleplay.conf
index b1a463e1..bc0de3f0 100644
--- a/meta-beagle/conf/machine/beagleplay.conf
+++ b/meta-beagle/conf/machine/beagleplay.conf
@@ -6,13 +6,10 @@ require conf/machine/beagleplay-ti.conf
 
 require conf/machine/include/beagle-bsp.inc
 
-UBOOT_MACHINE:bsp-bb_org-6_6 = "am62x_beagleplay_a53_defconfig"
+UBOOT_MACHINE:bsp-bb_org-6_1 = "am62x_evm_a53_defconfig"
 
 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_a53.config"
 
-SPL_BINARY:bsp-bb_org-6_6 = "tispl.bin_unsigned"
-SPL_BINARYNAME:bsp-bb_org-6_6 = "tispl.bin"
-
 KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
index c27e0abc..72dc145b 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
@@ -8,9 +8,7 @@ SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
-UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_r5_defconfig"
-UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_r5_defconfig"
+UBOOT_MACHINE = "am62x_beagleplay_r5_defconfig"
+UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
 
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_r5.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
index 68d6dced..3824d867 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
@@ -19,15 +19,12 @@ TFA_K3_SYSTEM_SUSPEND = "1"
 
 OPTEEMACHINE = "k3-am62x"
 
-UBOOT_MACHINE = "am62x_evm_a53_defconfig"
-UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_a53_defconfig"
-UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_a53_defconfig"
+UBOOT_MACHINE = "am62x_beagleplay_a53_defconfig"
+UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
 
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_a53.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_a53.config"
 
-SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
-SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
+SPL_BINARY = "tispl.bin_unsigned"
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625-beagle \
-- 
2.17.1


