Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E723E732FE
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 17:08:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.19119.1695920917138603349
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 10:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ojH8Rjh1;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38SH8afk067795;
	Thu, 28 Sep 2023 12:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695920916;
	bh=3kiaGmKDq8Qrp7FnH13qtuFnVxJnq/aWb/SR4Dt8x7c=;
	h=From:To:CC:Subject:Date;
	b=ojH8Rjh1ys9tDEecA8JjjZjV80mf0S4gM9QmC2fjz8ZBwnWW8ImXhpwY4SoH+vqQF
	 V73KLeaZe/sW3SjCVtWnixrGFd5wIXTVWATau2xv94vhY9Ak/01sxR8Rw9904Dd0Rg
	 oqsJl2jEVsQ+OtLAUZCyeHpQ6088qoWuUn9eiWA8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38SH8ZmK022012
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Sep 2023 12:08:35 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Sep 2023 12:08:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Sep 2023 12:08:35 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38SH8ZZu054430;
	Thu, 28 Sep 2023 12:08:35 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Randolph Sapp <rs@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [kirkstone/master PATCH] linux-ti-staging: am335x/am437x: Add no_smp option
Date: Thu, 28 Sep 2023 12:08:35 -0500
Message-ID: <20230928170835.23715-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Sep 2023 17:08:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17023

From: Praneeth Bajjuri <praneeth@ti.com>

multi_v7_defconfig that is used for legacy platforms enables
SMP by default.

Platforms like am335x and am473x are single core platforms that
doesnt need this option to be enabled.

This config cannot go in multi_v7_defconfig as well,
since there will be systems like am57x/dra7x or other community platforms
which can have multiple arm cores.

Adding the provision to disable SMP configuration for applicable platforms like
am335x and am437x.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconfig   | 2 ++
 .../recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconfig   | 2 ++
 .../linux/linux-ti-staging-rt-6.1/ti33x/defconfig               | 2 ++
 .../linux/linux-ti-staging-rt-6.1/ti43x/defconfig               | 2 ++
 4 files changed, 8 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti33x/defconfig
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti43x/defconfig

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconfig
new file mode 100644
index 00000000..e6a967e1
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti33x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconfig
new file mode 100644
index 00000000..e6a967e1
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/ti43x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti33x/defconfig
new file mode 100644
index 00000000..5de2b229
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti33x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti43x/defconfig
new file mode 100644
index 00000000..5de2b229
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/ti43x/defconfig
@@ -0,0 +1,2 @@
+use-kernel-config=multi_v7_defconfig
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config
-- 
2.17.1


