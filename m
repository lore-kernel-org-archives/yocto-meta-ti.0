Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D40C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 20:09:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.229.1714162182830721036
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 13:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vcjdHq66;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43QK9fF3028663;
	Fri, 26 Apr 2024 15:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714162181;
	bh=i5L2uINm3oCk2IPwBvRDMf+BaHecyOkD2m8lOiEEbuM=;
	h=From:To:Subject:Date;
	b=vcjdHq66dOGE+rWCow9/YyzzGSDnGCgIaoqgqBU3XqPFffPWc4iaSiZvRJ8BzKha7
	 uidJH1IQacFGgXBjPxpV1j0O02vKm9X6LeubUcg6ErYnUcP7d5IBxQHXl5FqYlrsIE
	 5nxQ9CNyqEmF028q+dAZw6OhK/v6jZ43FrEYPFDg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43QK9fe8076466
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Apr 2024 15:09:41 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Apr 2024 15:09:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Apr 2024 15:09:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43QK9eeO106113;
	Fri, 26 Apr 2024 15:09:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s0Rt6-0005on-Pr; Fri, 26 Apr 2024 15:09:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] conf: am57/am33/am43: Add/fix DEVICETREE_FILE
Date: Fri, 26 Apr 2024 15:09:40 -0500
Message-ID: <20240426200940.22326-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Apr 2024 20:09:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17605

The new kernel directory stucture for the DTBs is causing problems when
assembing the image files.  It produces errors like this:

output: install: cannot stat 'deploy-ti/images/XXXX-evm/omap/XXXX.dtb': No such file or directory

or

output: install: cannot stat 'deploy-ti/images/XXXX-evm/ti/omap/XXXX.dtb': No such file or directory

The issue comes from the UBOOT_EXTLINUX_BOOT_FILES list.  am57 already
had a mechanism but it was missing the omap/ dir to remove, and am33 and
am43 were just takeing KERNEL_DEVICETREE directly.  This patch fixes
both cases.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 4 +++-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index 6187f2ea..a875713f 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -24,7 +24,7 @@ UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
-DEVICETREE_FILE = "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("ti/","")}"
+DEVICETREE_FILE = "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("ti/omap/","").replace("ti/","")}"
 
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX = "1"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index 6cd7e568..b0ed1c69 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -44,6 +44,8 @@ UBOOT_MACHINE = "am335x_evm_config"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+DEVICETREE_FILE = "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("ti/omap/","")}"
+
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX = "1"
 UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
@@ -51,7 +53,7 @@ UBOOT_EXTLINUX_KERNEL_ARGS = "rootwait rw earlycon"
 UBOOT_EXTLINUX_BOOT_FILES = " \
     extlinux.conf;extlinux/extlinux.conf \
     ${KERNEL_IMAGETYPE} \
-    ${KERNEL_DEVICETREE} \
+    ${DEVICETREE_FILE} \
 "
 
 SPL_BINARY = "MLO"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index ec4bd115..17ca5240 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -41,13 +41,15 @@ UBOOT_MACHINE = "am43xx_evm_config"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+DEVICETREE_FILE = "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("ti/omap/","")}"
+
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX = "1"
 UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
 UBOOT_EXTLINUX_BOOT_FILES = " \
     extlinux.conf;extlinux/extlinux.conf \
     ${KERNEL_IMAGETYPE} \
-    ${KERNEL_DEVICETREE} \
+    ${DEVICETREE_FILE} \
 "
 
 SPL_BINARY = "MLO"
-- 
2.17.1


