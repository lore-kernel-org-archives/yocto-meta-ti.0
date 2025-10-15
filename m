Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21CFCCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:00:52 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.14455.1760529642580786359
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 05:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xywkMna7;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FC0fSP1747682;
	Wed, 15 Oct 2025 07:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760529641;
	bh=EJC8vsjknZah7j/kkbBPhX1zAbENWqDH6judrBnCtIs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xywkMna7+Vw3xbIX1Y9w+q/H0xKb1B2MWpUhtC8j2OAfbR/d1T2eXh7/C99LBf0XJ
	 lAmh5HhyiRt4tWZZ1eG23j/2uT04wzoNEXwo7qgN13rI2yCg20/zkc1gYEqBZayzax
	 pk+p00H3GkvVtMtXIl2YOJGVd+WOveK8QCvLcF4U=
Received: from DLEE204.ent.ti.com (dlee204.ent.ti.com [157.170.170.84])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FC0eEY1203050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 07:00:40 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 07:00:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 07:00:40 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FC0W7K1859032;
	Wed, 15 Oct 2025 07:00:37 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH v5 1/4] meta-ti-bsp: conf: machine: include: Add common module variable for TI Initramfs image
Date: Wed, 15 Oct 2025 17:30:29 +0530
Message-ID: <20251015120032.288741-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015120032.288741-1-m-shah@ti.com>
References: <20251015120032.288741-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 12:00:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19127

Add a new variable in ti-soc.inc which would be populated by individual
platforms with the required modules which would later be packaged inside
the initramfs image.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62axx.inc | 3 +++
 meta-ti-bsp/conf/machine/include/j721e.inc   | 3 +++
 meta-ti-bsp/conf/machine/include/j784s4.inc  | 3 +++
 meta-ti-bsp/conf/machine/include/ti-soc.inc  | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index 964be0ad..bacee3a6 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -11,3 +11,6 @@ TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
+
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = "kernel-module-tps6594-i2c"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = "kernel-module-tps6594-i2c"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index f9fdac0c..f413f5d8 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -19,3 +19,6 @@ TI_VXE_VXD_DRIVER = "ti-vxe-vxd-driver"
 TI_VXE_VXD_DRIVER:bsp-ti-6_6 = ""
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw-j721e ${TI_VXE_VXD_DRIVER}"
+
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 759984ea..ebc3d576 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -13,3 +13,6 @@ TFA_BOARD = "j784s4"
 OPTEEMACHINE = "k3-j784s4"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
+
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
index 018e9bfb..1d18ceab 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -27,3 +27,5 @@ CLASS_DEVICETREE_PREFIX = "${@ 'ti-devicetree-prefix' if d.getVar('KERNEL_DEVICE
 
 KERNEL_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
 IMAGE_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
+
+TI_INITRAMFS_KERNEL_MODULES ?= ""
\ No newline at end of file
-- 
2.34.1


