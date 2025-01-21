Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A111BC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 17:56:34 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.22078.1737482189424286300
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 09:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fGp8e51P;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHuSwH866080
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:56:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737482188;
	bh=rQO77c8vQTl0Yc6MkhVBpDH3a+4mXErHDbmNzZA5W2g=;
	h=From:To:CC:Subject:Date;
	b=fGp8e51PxPU7seTEwSFA2X/9I+Uf8BCsRA9BxfTb3BmyV8VkWwDO7e13hHLebJHqh
	 U47ChNbIRfx9DQPP/nBJl8NV8KUq0Ka1joAcCmiv6UD8wK7Pkv665ELMiJADrLzLOr
	 fFoxQSSpRK0zVHQSuR14wo2++7BkpL6R1kOfXDdA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHuSCW001111
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 11:56:28 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 11:56:28 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 11:56:28 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LHuPbU087671;
	Tue, 21 Jan 2025 11:56:26 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <u-kumar1@ti.com>, <afd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <b-padhi@ti.com>
Subject: [scarthgap][PATCH] linux-ti-staging: Add config-fragments for v6.12 Kernel
Date: Tue, 21 Jan 2025 23:26:25 +0530
Message-ID: <20250121175625.4114041-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jan 2025 17:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18210

ti-linux-kernel tree has several prune config fragments for ARM/ARM64/RT
configurations. Enable the prune config fragments here.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../recipes-kernel/linux/linux-ti-staging-6.12/defconfig        | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig     | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig  | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig  | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig     | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig  | 2 +-
 .../linux/linux-ti-staging-rt-6.12/ti33x/defconfig              | 2 +-
 .../linux/linux-ti-staging-rt-6.12/ti43x/defconfig              | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
index 9d579e41..24b53cf7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
index fd07b34e..ef1d3efd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_arm64_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
index 9d579e41..e6a967e1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
index 9d579e41..e6a967e1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
index 9d579e41..43089dc8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
index fd07b34e..47d78664 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_arm64_prune.config kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
index 9d579e41..5de2b229 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
index 9d579e41..5de2b229 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config kernel/configs/no_smp.config
-- 
2.34.1


