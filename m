Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C53C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 23:27:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.103234.1738625258179234451
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 15:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F9eU0vdo;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513NRahj3044521
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 17:27:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738625256;
	bh=c62QxRtwFFV1sraOwIHCsvmqERRtnceE4Ix2Y79Xb9A=;
	h=From:To:Subject:Date;
	b=F9eU0vdoC/K8bhr2OS+Qhv+RZCqt9BuTpCUwj3Xu/zlLnnHK9blVmS7Tp2z9RUC3X
	 lLdShVFs3Vqq8O8mGladqQlVi0y+g+wDdKtskQg0Ay3S6gPBLsnEDzK3y7T7/lNENl
	 f2JA/p7LEZd8Suyu+mtcD1/2gwQxE8gRa6CZZBcc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513NRaR8059256
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 17:27:36 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 17:27:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 17:27:36 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513NRalX046016;
	Mon, 3 Feb 2025 17:27:36 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tf5qq-0002M9-C9; Mon, 03 Feb 2025 17:27:36 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot: Fix implicit declaration compile error
Date: Mon, 3 Feb 2025 17:27:36 -0600
Message-ID: <20250203232736.9017-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Feb 2025 23:27:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18252

A recent patch to ti-u-boot 2025.01 introduces a compile error on
master for am64xx-evm.  A patch has been sent to the mailing list
that fixes this, but it will take time before we will see that patch
available to us on master.  So we need to carry the patch here.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../u-boot/u-boot-ti-staging_2025.01.bb       |  2 ++
 ...-Fix-implicit-definition-of-ti_secur.patch | 32 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 5e56d2db..c041ffe8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,6 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
+SRC_URI += "file://0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch"
+
 SRCREV = "4e9c90ad8b12cc5b4fdd1308bc3ac3e4fc869aab"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch b/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch
new file mode 100644
index 00000000..c6b15651
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-remoteproc-k3-m4-Fix-implicit-definition-of-ti_secur.patch
@@ -0,0 +1,32 @@
+From f9c2ae13a80f3b0f309214c6b57bc3a705b71398 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 3 Feb 2025 16:54:24 -0600
+Subject: [tiU25.01]] remoteproc: k3-m4: Fix implicit definition of
+ ti_secure_image_post_process
+
+Add missing include to make sure that ti_secure_image_post_process() is
+not implicitly declared.
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+
+Upstream-Status: Pending
+
+---
+ drivers/remoteproc/ti_k3_m4_rproc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/remoteproc/ti_k3_m4_rproc.c b/drivers/remoteproc/ti_k3_m4_rproc.c
+index 5a5ae2fa81d..516c817385e 100644
+--- a/drivers/remoteproc/ti_k3_m4_rproc.c
++++ b/drivers/remoteproc/ti_k3_m4_rproc.c
+@@ -20,6 +20,7 @@
+ #include <linux/sizes.h>
+ #include <linux/soc/ti/ti_sci_protocol.h>
+ #include "ti_sci_proc.h"
++#include <mach/security.h>
+ 
+ /**
+  * struct k3_m4_mem - internal memory structure
+-- 
+2.17.1
+
-- 
2.17.1


