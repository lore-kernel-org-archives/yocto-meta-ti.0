Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C65AEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:52:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9714.1689691931744050875
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 07:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nfRwXbMn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36IEqA1t085661;
	Tue, 18 Jul 2023 09:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689691930;
	bh=2fSFnL3QFngza3H4X7t75MMFHjdNk+ElFq2N+PjsXRs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nfRwXbMnR7g2rCZgLfKvZ1Jbxcqk24eKpl1b7SBSgVXK8hgi15lS3roEhoFbLiGxU
	 +FMSuvQMy3pj24rFf0Kd6PsLKSkmYqoqAE+5WFkrlAwXxHTh3xlaMxn2djz5cuLhHB
	 5E6YeazZk8dwY1rUys33tpCoPmzckx86PeKwGvb4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36IEqA48021364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jul 2023 09:52:10 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jul 2023 09:52:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jul 2023 09:52:10 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36IEq9NZ005203;
	Tue, 18 Jul 2023 09:52:09 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/3] conf: Remove old and no longer used MACHINE_FEATURES
Date: Tue, 18 Jul 2023 09:52:07 -0500
Message-ID: <20230718145208.18584-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718145208.18584-1-afd@ti.com>
References: <20230718145208.18584-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Jul 2023 14:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16849

The following MACHINE_FEATURES are not matched against anywhere, remove:
 * kernel26
 * ethernet
 * mmc

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc       | 2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 meta-ti-bsp/conf/machine/include/omapl138.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 366db16d..8f6f4014 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -47,7 +47,7 @@ TFA_PLATFORM = "k3"
 UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
+MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index 700b1a11..c9d16f3c 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -45,7 +45,7 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu mmip dsp gc320"
+MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc320"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
diff --git a/meta-ti-bsp/conf/machine/include/omapl138.inc b/meta-ti-bsp/conf/machine/include/omapl138.inc
index 2e4a47a5..72cfd659 100644
--- a/meta-ti-bsp/conf/machine/include/omapl138.inc
+++ b/meta-ti-bsp/conf/machine/include/omapl138.inc
@@ -11,4 +11,4 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
-MACHINE_FEATURES = "kernel26 serial ethernet usbhost usbgadget mmc alsa"
+MACHINE_FEATURES = "serial usbhost usbgadget alsa"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index ec53e612..f7f126f4 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -60,7 +60,7 @@ UBI_VOLNAME = "rootfs"
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet gpu"
+MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa gpu"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index c1009dc6..a6af56e3 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -58,7 +58,7 @@ UBI_VOLNAME = "rootfs"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu"
+MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
-- 
2.39.2


