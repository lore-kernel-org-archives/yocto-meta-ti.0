Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958CFE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:56:33 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.154884.1734710187702848122
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 07:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nKaRhKfz;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKFuQoZ483296
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 20 Dec 2024 09:56:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734710186;
	bh=FSK7F8kif+gwmU9D43U9KB0hs8FSv4axMB5uIMyEN7k=;
	h=From:To:CC:Subject:Date;
	b=nKaRhKfznWjtJx6mn2Nfx1f+imCdxlWeOLHaDcu/3ulFZNxrUmFr1eJ0jNMNryOsU
	 KOCnDaPBJcSoDoxE51dtao5ggEEcyQFh8avYyv7v7EZvCoM37l+LA6qgeSRkPnNSXd
	 oU9TosrWwgN5nN+Zir8pKltkGfmh8acio6t2Bs9w=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKFuQnN026535;
	Fri, 20 Dec 2024 09:56:26 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 09:56:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 09:56:25 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKFuPt7064758;
	Fri, 20 Dec 2024 09:56:25 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] linux-ti-staging: Drop systest kernel
Date: Fri, 20 Dec 2024 09:56:24 -0600
Message-ID: <20241220155624.202504-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Dec 2024 15:56:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18165

This was used when the kernel had a different configuration for
the testing kernel. This has not been the case since v5.10 so
drop the systest kernel package as it will be the same as the
normal kernel package now.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                | 1 -
 .../linux/linux-ti-staging-systest-6.1/defconfig           | 2 --
 .../linux/linux-ti-staging-systest-6.1/k3/defconfig        | 2 --
 .../linux/linux-ti-staging-systest-6.1/omapl138/defconfig  | 1 -
 .../linux/linux-ti-staging-systest-6.12/defconfig          | 2 --
 .../linux/linux-ti-staging-systest-6.12/k3/defconfig       | 2 --
 .../linux/linux-ti-staging-systest-6.12/omapl138/defconfig | 1 -
 .../linux/linux-ti-staging-systest-6.6/defconfig           | 2 --
 .../linux/linux-ti-staging-systest-6.6/k3/defconfig        | 2 --
 .../linux/linux-ti-staging-systest-6.6/omapl138/defconfig  | 1 -
 .../recipes-kernel/linux/linux-ti-staging-systest_6.1.bb   | 5 -----
 .../recipes-kernel/linux/linux-ti-staging-systest_6.12.bb  | 7 -------
 .../recipes-kernel/linux/linux-ti-staging-systest_6.6.bb   | 5 -----
 13 files changed, 33 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 4bbe7668..0624099a 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -106,7 +106,6 @@ BSP_MESA_PVR_VERSION ?= ""
 PREFERRED_PROVIDER_virtual/kernel ?= "${BSP_KERNEL_PROVIDER}"
 PREFERRED_VERSION_${BSP_KERNEL_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
 PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-rt ?= "${BSP_KERNEL_VERSION}"
-PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-systest ?= "${BSP_KERNEL_VERSION}"
 PREFERRED_PROVIDER_virtual/bootloader ?= "${BSP_BOOTLOADER_PROVIDER}"
 PREFERRED_PROVIDER_u-boot ?= "${BSP_BOOTLOADER_PROVIDER}"
 PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?= "${BSP_BOOTLOADER_VERSION}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
deleted file mode 100644
index 24b53cf7..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=multi_v7_defconfig
-config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
deleted file mode 100644
index ef1d3efd..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=defconfig
-config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
deleted file mode 100644
index 099493af..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig
deleted file mode 100644
index 9d579e41..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=multi_v7_defconfig
-config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig
deleted file mode 100644
index fd07b34e..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=defconfig
-config-fragment=
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig
deleted file mode 100644
index 099493af..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/defconfig
deleted file mode 100644
index 24b53cf7..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=multi_v7_defconfig
-config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/k3/defconfig
deleted file mode 100644
index ef1d3efd..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/k3/defconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-use-kernel-config=defconfig
-config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/omapl138/defconfig
deleted file mode 100644
index 099493af..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.6/omapl138/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=davinci_all_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
deleted file mode 100644
index 9c170e65..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require linux-ti-staging_6.1.bb
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
deleted file mode 100644
index 8ce23368..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require linux-ti-staging_6.12.bb
-
-DEFAULT_PREFERENCE = "-1"
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb
deleted file mode 100644
index a17b744b..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require linux-ti-staging_6.6.bb
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
-- 
2.39.2


