Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8154CF0427
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 20:52:24 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6641.1728420741432937548
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 13:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k3rZ03WM;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498KqKv8082892;
	Tue, 8 Oct 2024 15:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728420740;
	bh=RfhYs7oTrK9tAYKghAKsTRAobyO/fZopS1LsvsOhKHE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=k3rZ03WMiKLJN8H0vu+wDigvgebuQz2vbXU+exasORyXAPrlInRYCxjZYhIYx3N4V
	 /lX3H2kLttwKrhI3i6G08LBP/JflVav/ebUTTY0/FMrPWwSXCU2jub2jB+Qni6xKTC
	 G9tGNceJA9IfdwuKTQCxMFUU2PCOjH7a82oWwZlY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 498KqK2H061233
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Oct 2024 15:52:20 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 15:52:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 15:52:19 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498KqKGN068819;
	Tue, 8 Oct 2024 15:52:20 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1syHBs-000145-6h; Tue, 08 Oct 2024 15:52:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH v2 4/4] debugss-module-drv: Add patch for kernel 6.11 change
Date: Tue, 8 Oct 2024 15:52:19 -0500
Message-ID: <20241008205219.4037-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241008205219.4037-1-reatmon@ti.com>
References: <20241008205219.4037-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 20:52:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17995

There was a change to the return value for a function pointer in the
kernel v6.11.  This patch adapts the module to the kernel change.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../dsptop/debugss-module-drv_git.bb          |  5 +-
 ...kernel-6.11-changed-return-value-for.patch | 58 +++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-extras/recipes-bsp/dsptop/files/0002-debugss_kmodule-kernel-6.11-changed-return-value-for.patch

diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index 81e544f7..74ceed9d 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -18,4 +18,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 include dsptop.inc
 
-SRC_URI += "file://0001-debugss_kmodule-Add-include-for-mod_devicetable.h.patch"
+SRC_URI += "\
+    file://0001-debugss_kmodule-Add-include-for-mod_devicetable.h.patch \
+    file://0002-debugss_kmodule-kernel-6.11-changed-return-value-for.patch \
+"
diff --git a/meta-ti-extras/recipes-bsp/dsptop/files/0002-debugss_kmodule-kernel-6.11-changed-return-value-for.patch b/meta-ti-extras/recipes-bsp/dsptop/files/0002-debugss_kmodule-kernel-6.11-changed-return-value-for.patch
new file mode 100644
index 00000000..4e9727a0
--- /dev/null
+++ b/meta-ti-extras/recipes-bsp/dsptop/files/0002-debugss_kmodule-kernel-6.11-changed-return-value-for.patch
@@ -0,0 +1,58 @@
+From aaddf1fa8b92db23ae2ebc83826c2bb5f5c87c35 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Thu, 3 Oct 2024 14:25:18 -0500
+Subject: [PATCH] debugss_kmodule: kernel 6.11 changed return value for remove
+ slot
+
+In kernel version 6.11 the function footprint changed for the remove
+slot to return a void instead of an int. [1]
+
+Add ifdef checking code to look for kernel version and pick the correct
+return code.
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/platform_device.h?id=0edb555a65d1ef047a9805051c36922b52a38a9d
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2021-04-20]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ debugss_kmodule.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/debugss_kmodule.c b/debugss_kmodule.c
+index 9e084eb..4191be8 100644
+--- a/debugss_kmodule.c
++++ b/debugss_kmodule.c
+@@ -27,6 +27,7 @@
+ #include "debugss_kmodule.h"
+ 
+ #include <linux/mod_devicetable.h>
++#include <linux/version.h>
+ 
+ /* un-comment the line below to enable printing for kernel debug messages */
+ //#define DEBUGSS_DRV_DEBUG
+@@ -1132,7 +1133,11 @@ static int dra7xx_debugss_probe(struct platform_device *pdev)
+ 	return retval;
+ }
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 11, 0))
+ static int dra7xx_debugss_remove(struct platform_device *pdev)
++#else
++static void dra7xx_debugss_remove(struct platform_device *pdev)
++#endif
+ {
+ 	__D("%s:\n",__FUNCTION__);
+ 
+@@ -1145,7 +1150,9 @@ static int dra7xx_debugss_remove(struct platform_device *pdev)
+ 	/* Un-prepare debugSS clock */
+ 	clk_disable_unprepare(sys_clk_in1);
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 11, 0))
+ 	return 0;
++#endif
+ }
+ 
+ static const struct of_device_id dra7xx_debugss_of_match[] = {
+-- 
+2.17.1
+
-- 
2.17.1


