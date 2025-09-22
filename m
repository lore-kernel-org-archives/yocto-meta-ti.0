Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2B2CAC5AA
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:40:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.53787.1758552011055040325
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 07:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tCA0n0UZ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MEeA7T1273743;
	Mon, 22 Sep 2025 09:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758552010;
	bh=/LzXeMVbwKxHq+RsodmgIX1VEa/QV0o1VsZ5Gy/bCuo=;
	h=From:To:Subject:Date;
	b=tCA0n0UZ+ss53AprtMDL5vtZDZHpB2UYmLo6A5TB5B2cIILM8gY+8xqn3Hyj0f17D
	 U/fK1jy42Gji16XYWSUwK1qd03NldVbqtf4Fjc04ar9bvuFtySTLnXqeY/9lnlVmFz
	 nMsUpnyuL5sfmNR+vV/lFCqlOb4OIvZyNRveTSxc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MEeA8m953420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 09:40:10 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 09:40:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 09:40:09 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MEe9dM2940560;
	Mon, 22 Sep 2025 09:40:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v0hi5-00014B-7r; Mon, 22 Sep 2025 09:40:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-extras: Clean up
Date: Mon, 22 Sep 2025 09:40:09 -0500
Message-ID: <20250922144009.4059-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:40:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19049

The TI_EXTRAS infrastructure needs a little tweaking to support turning
on multiple extra options at the same time.

1) Since TI_EXTRAS can be a space separated list and not a single fixed
value, we need to change how we detect when to include the TI_EXTRA
values.

2) The tie-jailhouse overrides were being a little too heavy handed.
All of the variables that are changed for any given extra feature needs
to use the proper variable override.  This was most important for the
COMPATIBLE_MACHINE settings.

3) Move the ti-extras out of specific machine configs and into the
ti-soc so that all machines can use the extras.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf        |  1 -
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   |  1 -
 meta-ti-bsp/conf/machine/am62pxx-evm.conf        |  1 -
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    |  1 -
 meta-ti-bsp/conf/machine/am62xx-evm.conf         |  1 -
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf |  1 -
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf      |  1 -
 meta-ti-bsp/conf/machine/include/ti-extras.inc   |  2 +-
 meta-ti-bsp/conf/machine/include/ti-soc.inc      |  1 +
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc     | 16 +++++++---------
 .../recipes-kernel/linux/ti-extras-rt.inc        | 15 +++++----------
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc   | 16 +++++++---------
 12 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 607092a7..a0bccf57 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62L EVM
 
 require conf/machine/include/am62lxx.inc
-require conf/machine/include/ti-extras.inc
 
 IMAGE_FSTYPES += "ubifs ubi"
 
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
index 28378209..a4b1005b 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
-require conf/machine/include/ti-extras.inc
 
 SYSFW_SOC = "am62px"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 3f9249e6..08bc2cf4 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62PX EVM
 
 require conf/machine/include/am62pxx.inc
-require conf/machine/include/ti-extras.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62p5 \
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
index 5c5b133f..cd95a45e 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
-require conf/machine/include/ti-extras.inc
 
 SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index 298fc170..dd91ae66 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62XX EVM
 
 require conf/machine/include/am62xx.inc
-require conf/machine/include/ti-extras.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625 \
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 7203ebf7..29638d1d 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
-require conf/machine/include/ti-extras.inc
 
 SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 32e88051..bbc9dfd6 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
 
 require conf/machine/include/am62xx.inc
-require conf/machine/include/ti-extras.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
diff --git a/meta-ti-bsp/conf/machine/include/ti-extras.inc b/meta-ti-bsp/conf/machine/include/ti-extras.inc
index 4e62605c..1ef2fd3b 100644
--- a/meta-ti-bsp/conf/machine/include/ti-extras.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-extras.inc
@@ -1,4 +1,4 @@
 # Add TI_EXTRAS to machine overrides so we get access to e.g. 'jailhouse'
 
 TI_EXTRAS ??= ""
-MACHINEOVERRIDES =. "${@ '${TI_EXTRAS}:' if d.getVar('TI_EXTRAS').startswith('tie-') else ''}"
+MACHINEOVERRIDES =. "${@ ':'.join('${TI_EXTRAS}'.strip().split()) + ':' if d.getVar('TI_EXTRAS') else ''}"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
index 018e9bfb..438dd6ab 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -2,6 +2,7 @@
 # and platforms defined in meta-ti to allow BSP-level overrides.
 SOC_FAMILY = "ti-soc"
 require conf/machine/include/soc-family.inc
+require conf/machine/include/ti-extras.inc
 
 # kernel, initrd load addresses for the fitImage in all TI platforms
 UBOOT_ENTRYPOINT = "0x82000000"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
index e334ada0..b1802e27 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -1,12 +1,10 @@
+#
+# Jailhouse settings
+#
+COMPATIBLE_MACHINE:tie-jailhouse = "am62xx|am62pxx|am62lxx"
 
-# This will have priority over generic uboot path
+BRANCH:tie-jailhouse:bsp-ti-6_12 = "ti-u-boot-2025.01-jailhouse"
 
-COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
+SRCREV:tie-jailhouse:bsp-ti-6_12 = "e718bbcec3ebf663c021839753034a224be4cc53"
 
-BRANCH = "ti-u-boot-2025.01"
-BRANCH:tie-jailhouse = "ti-u-boot-2025.01-jailhouse"
-
-SRCREV = "e718bbcec3ebf663c021839753034a224be4cc53"
-SRCREV:tie-jailhouse = "e718bbcec3ebf663c021839753034a224be4cc53"
-
-UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
+UBOOT_GIT_URI:tie-jailhouse = "git://git.ti.com/git/processor-sdk/u-boot.git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
index dba9ef38..859b4801 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
@@ -1,11 +1,6 @@
+#
+# Jailhouse settings
+#
+BRANCH:tie-jailhouse:bsp-ti-6_12 = "ti-linux-6.12.y-jailhouse"
 
-# Use different commit, repo and branch for TI extras build
-# This will have priority over generic rt path
-
-COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
-
-BRANCH = "ti-linux-6.12.y"
-BRANCH:tie-jailhouse = "ti-linux-6.12.y-jailhouse"
-
-SRCREV = "c9e21a1ebd757f2b4487035382bbf65299cf8170"
-SRCREV:tie-jailhouse = "229a48602ad1557612a4ffabec6a3cbcdd745f87"
+SRCREV:tie-jailhouse:bsp-ti-6_12 = "229a48602ad1557612a4ffabec6a3cbcdd745f87"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
index 4b7a9f20..1b7239f9 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -1,14 +1,12 @@
-
-# Use different commit, repo and branch for TI extras build
 # This will have priority over generic rt path
 
-COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
-
-BRANCH = "ti-linux-6.12.y"
-BRANCH:tie-jailhouse = "ti-linux-6.12.y-jailhouse"
+#
+# Jailhouse settings
+#
+COMPATIBLE_MACHINE:tie-jailhouse = "am62xx|am62pxx|am62lxx"
 
-SRCREV = "c9e21a1ebd757f2b4487035382bbf65299cf8170"
-SRCREV:tie-jailhouse = "229a48602ad1557612a4ffabec6a3cbcdd745f87"
+BRANCH:tie-jailhouse:bsp-ti-6_12 = "ti-linux-6.12.y-jailhouse"
 
-KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
+SRCREV:tie-jailhouse:bsp-ti-6_12 = "229a48602ad1557612a4ffabec6a3cbcdd745f87"
 
+KERNEL_GIT_URI:tie-jailhouse = "git://git.ti.com/git/processor-sdk/linux.git"
-- 
2.17.1


