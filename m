Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F536E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 15:16:44 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.131044.1734621401211840389
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 07:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TubbvWA5;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJFGeHU022461
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 19 Dec 2024 09:16:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734621400;
	bh=/FT3JGAHyvTUB5a3ViP1EohsEoEIsVDfeKRCv7k8kUE=;
	h=From:To:Subject:Date;
	b=TubbvWA5o1QGZT30hloIezAtkAFwyxeAC/R0EKlNYdY+dczhPxgejhFGl/AgxCD/M
	 SFSptPTltEOQOmW9t3vc0WNCrU7f9RVC35wsPZtqZkoQRfX0GjGO3dZjoOlhNQ95bu
	 5DlbdPP6pLEzYAPNFr3J6iFjytHGAgYkEGFs6/C8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJFGeLD086226;
	Thu, 19 Dec 2024 09:16:40 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 09:16:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 09:16:39 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJFGdDb102256;
	Thu, 19 Dec 2024 09:16:39 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOIGV-0008T9-I7; Thu, 19 Dec 2024 09:16:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-staging: Move 2024.10 to 2025.01 for ltsprep
Date: Thu, 19 Dec 2024 09:16:38 -0600
Message-ID: <20241219151639.32515-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 15:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18144

We are moving to 2025.01 for the next LTS, so rename the previous ltsprep
recipe and update it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc         |  4 ++--
 .../recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb | 13 -------------
 .../recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 11 +++++++++++
 3 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 4bbe7668..083177dc 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -37,12 +37,12 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
 
 # ==========
 # ti-6_12
-# TI staging kernel 6.12, u-boot 2024.10
+# TI staging kernel 6.12, u-boot 2025.01
 # ==========
 BSP_KERNEL_PROVIDER:bsp-ti-6_12 = "linux-ti-staging"
 BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
-BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
 
 # GPU support requires out-of-tree SGX and Rogue drivers not available
 # in 6.12 yet
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
deleted file mode 100644
index a2e0934c..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require u-boot-ti.inc
-
-DEFAULT_PREFERENCE = "-1"
-
-include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
-
-PR = "r0"
-
-BRANCH = "ti-u-boot-2024.10"
-
-SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
-
-SRCREV = "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
new file mode 100644
index 00000000..e71008fa
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -0,0 +1,11 @@
+require u-boot-ti.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
+
+PR = "r0"
+
+BRANCH = "ti-u-boot-2025.01"
+
+SRCREV = "b841e559cd26ffcb20f22e8ee75debed9616c002"
-- 
2.17.1


