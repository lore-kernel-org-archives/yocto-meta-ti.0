Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24C7C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 15:12:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9935.1690470741262295454
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 08:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ojTbMcQJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36RFCG4B039655;
	Thu, 27 Jul 2023 10:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690470736;
	bh=BawgSJ26fVLXW7RD9/L0DPUifmPEl7EiaqeXI4oQusc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ojTbMcQJtDQW10B3KOMvOx3oTrNiAhkBv2IXlBP0YPb0DrCw2iXGbpnmvO8Ev1AOm
	 0Awxuaw9l8iv4ieQnByuzso/hcXNywtaq+EV6aVbTQldRlImNpapZsuJRy5JY5DIvp
	 NmF8kCPKA61L7iTiPSXHDp0WkTgocCXQp918trv0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36RFCGsu023394
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jul 2023 10:12:16 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jul 2023 10:12:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jul 2023 10:12:16 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36RFCGi3015780;
	Thu, 27 Jul 2023 10:12:16 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qP2f2-00063L-FX; Thu, 27 Jul 2023 10:12:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v2 2/2] linux-ti-next,conf/machine: Add support for new vendored dts dir
Date: Thu, 27 Jul 2023 10:12:16 -0500
Message-ID: <20230727151216.23224-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230727151216.23224-1-reatmon@ti.com>
References: <20230727151216.23224-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Jul 2023 15:12:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16865

The latest kernel has made the change to add vendor subdirectories into
the arch/arm/boot/dts directory.  This effectively breaks the
KERNEL_DEVICETREE settings in the machine configs for 32bit platforms,
so switch them over to using the PREFIX variable.  Also change the
linux-ti-next to use the PREFIX setting for KERNEL_DEVICETREE.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added previous KERNEL_DEVICETREE entries back in.

 meta-ti-bsp/conf/machine/am57xx-evm.conf              | 3 +++
 meta-ti-bsp/conf/machine/dra7xx-evm.conf              | 1 +
 meta-ti-bsp/conf/machine/include/ti33x.inc            | 5 ++++-
 meta-ti-bsp/conf/machine/include/ti43x.inc            | 2 ++
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf           | 5 ++++-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 1 +
 6 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index 26b7f78c..43a6a833 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -13,11 +13,14 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/am57 \
     ti/lcd \
     ti/ov10635 \
+    ti/omap/am57 \
 "
 
 KERNEL_DEVICETREE_DTBMERGE = " \
     am57xx-evm.dtb \
     am57xx-evm-reva3.dtb \
+    ti/omap/am57xx-evm.dtb \
+    ti/omap/am57xx-evm-reva3.dtb \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
index c47a1e80..30884ae1 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     dra7 \
     ti/dra7 \
     ti/lcd \
+    ti/omap/dra7 \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index f7f126f4..bc61a773 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -19,7 +19,10 @@ PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
 
 KERNEL_IMAGETYPE = "zImage"
 
-KERNEL_DEVICETREE_PREFIX = "am335x"
+KERNEL_DEVICETREE_PREFIX = " \
+    am335x \
+    ti/omap/am335x \
+"
 
 KERNEL_DEVICETREE = " \
     am335x-evm.dtb \
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index a6af56e3..ea5d1505 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -22,6 +22,8 @@ KERNEL_IMAGETYPE = "zImage"
 KERNEL_DEVICETREE_PREFIX = " \
     am437x \
     am43x \
+    ti/omap/am437x \
+    ti/omap/am43x \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
index a8b08964..fdbaffae 100644
--- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
+++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
@@ -15,7 +15,10 @@ IMAGE_FSTYPES += "tar.xz"
 
 SERIAL_CONSOLES = "115200;ttyS2"
 
-KERNEL_DEVICETREE_PREFIX = "da850"
+KERNEL_DEVICETREE_PREFIX = " \
+    da850 \
+    ti/davinci/da850 \
+"
 
 KERNEL_DEVICETREE = " \
     da850-evm.dtb \
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index 9138c7c5..8228f4ff 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 inherit kernel
 
 require recipes-kernel/linux/ti-kernel.inc
+include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
 
 DEPENDS += "gmp-native libmpc-native"
 
-- 
2.17.1


