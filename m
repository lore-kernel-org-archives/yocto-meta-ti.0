Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7BCC10F15
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 22:58:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1257.1714085896204590336
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Apr 2024 15:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=D1nf61Pu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43PMwDmV054684;
	Thu, 25 Apr 2024 17:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714085893;
	bh=JXGHIYe/8iwB/cK8da6E4cJNe89rjywwuPARV3zJ7ec=;
	h=From:To:Subject:Date;
	b=D1nf61PucH1KwEKgPl/LZPfD4sJ+3vvMZlZFf7NhsUsFUtv13fey2YYVWXZxuyH+k
	 5DN09n2f4RMxfojlXFBelu4quI5IgxEgS3+tQ4mAft0fdiIE8HagUe4juglZcTFXUV
	 domFGqXgNdofNBTf4jiGvokgl40hEO2Rrn3pm6Ko=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43PMwDrS107443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Apr 2024 17:58:13 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Apr 2024 17:58:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Apr 2024 17:58:13 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43PMwDB3018041;
	Thu, 25 Apr 2024 17:58:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s082f-00075e-8G; Thu, 25 Apr 2024 17:58:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: Update KERNEL_DEVICETREE for mainline 32bit platforms
Date: Thu, 25 Apr 2024 17:58:13 -0500
Message-ID: <20240425225813.27215-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Apr 2024 22:58:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17602

We missed that the KERNEL_DEVICETREE should have been updated for the
32bit platforms with the change in linux-ti-mainline to v6.6.  The new
directory structure under arch/arm/boot/dts is in effect for that
version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am57xx-evm.conf   | 14 +++++++-------
 meta-ti-bsp/conf/machine/dra7xx-evm.conf   | 10 +++++-----
 meta-ti-bsp/conf/machine/include/ti33x.inc | 22 +++++++++++-----------
 meta-ti-bsp/conf/machine/include/ti43x.inc |  8 ++++----
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index 8bcf20ea..09eb4705 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -25,13 +25,13 @@ KERNEL_DEVICETREE_DTBMERGE = " \
 "
 
 KERNEL_DEVICETREE = " \
-    am57xx-beagle-x15.dtb \
-    am57xx-beagle-x15-revb1.dtb \
-    am57xx-beagle-x15-revc.dtb \
-    am5729-beagleboneai.dtb \
-    am571x-idk.dtb \
-    am572x-idk.dtb \
-    am574x-idk.dtb \
+    ti/omap/am57xx-beagle-x15.dtb \
+    ti/omap/am57xx-beagle-x15-revb1.dtb \
+    ti/omap/am57xx-beagle-x15-revc.dtb \
+    ti/omap/am5729-beagleboneai.dtb \
+    ti/omap/am571x-idk.dtb \
+    ti/omap/am572x-idk.dtb \
+    ti/omap/am574x-idk.dtb \
 "
 
 UBOOT_MACHINE = "am57xx_evm_config"
diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
index 30884ae1..f9a3dd0b 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
@@ -16,11 +16,11 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
-    dra7-evm.dtb \
-    dra71-evm.dtb \
-    dra72-evm.dtb \
-    dra72-evm-revc.dtb \
-    dra76-evm.dtb \
+    ti/omap/dra7-evm.dtb \
+    ti/omap/dra71-evm.dtb \
+    ti/omap/dra72-evm.dtb \
+    ti/omap/dra72-evm-revc.dtb \
+    ti/omap/dra76-evm.dtb \
 "
 
 UBOOT_MACHINE = "dra7xx_evm_config"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index d6a70895..6cd7e568 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -25,17 +25,17 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
-    am335x-evm.dtb \
-    am335x-evmsk.dtb \
-    am335x-icev2.dtb \
-    am335x-pocketbeagle.dtb \
-    am335x-bone.dtb \
-    am335x-boneblue.dtb \
-    am335x-bonegreen.dtb \
-    am335x-bonegreen-wireless.dtb \
-    am335x-boneblack.dtb \
-    am335x-boneblack-wireless.dtb \
-    am335x-sancloud-bbe.dtb \
+    ti/omap/am335x-evm.dtb \
+    ti/omap/am335x-evmsk.dtb \
+    ti/omap/am335x-icev2.dtb \
+    ti/omap/am335x-pocketbeagle.dtb \
+    ti/omap/am335x-bone.dtb \
+    ti/omap/am335x-boneblue.dtb \
+    ti/omap/am335x-bonegreen.dtb \
+    ti/omap/am335x-bonegreen-wireless.dtb \
+    ti/omap/am335x-boneblack.dtb \
+    ti/omap/am335x-boneblack-wireless.dtb \
+    ti/omap/am335x-sancloud-bbe.dtb \
 "
 
 UBOOT_ARCH = "arm"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index 05a28b77..ec4bd115 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -27,10 +27,10 @@ KERNEL_DEVICETREE_PREFIX = " \
 "
 
 KERNEL_DEVICETREE = " \
-    am437x-gp-evm.dtb \
-    am437x-sk-evm.dtb \
-    am437x-idk-evm.dtb \
-    am43x-epos-evm.dtb \
+    ti/omap/am437x-gp-evm.dtb \
+    ti/omap/am437x-sk-evm.dtb \
+    ti/omap/am437x-idk-evm.dtb \
+    ti/omap/am43x-epos-evm.dtb \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.17.1


