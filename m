Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4440AC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 17:26:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.49473.1737566761054057054
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 09:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I5ug3PxZ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MHPxpM227332
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 11:25:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737566759;
	bh=laDNljEyC3hfi9Fbrd0XdldzyPrNRacbGo69g2KiK+g=;
	h=From:To:Subject:Date;
	b=I5ug3PxZfQkmu/ozdRUJenBMnOiZKhTT3I09T4M7ayyYQjlT5NPqiR+IdCgc+XaPJ
	 0gln0EVRxOYWWbYCjxAKboG75kCE8pbRTKgtio30gEof0SMehPhiq4qIfqRHqZ4tp7
	 fli/7IRY2+PBdxTbDLjJIOdMScM+aQHiHk2qHSv8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MHPxpi020617
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 11:25:59 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 11:25:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 11:25:59 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MHPwZ6090781;
	Wed, 22 Jan 2025 11:25:58 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1taeUI-0005u8-RT; Wed, 22 Jan 2025 11:25:58 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] linux-ti-staging: Add config-fragments for v6.12 Kernel
Date: Wed, 22 Jan 2025 11:25:58 -0600
Message-ID: <20250122172558.22656-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2025 17:26:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18216

From: Beleswar Padhi <b-padhi@ti.com>

ti-linux-kernel tree has several prune config fragments for ARM/ARM64/RT
configurations. Enable the prune config fragments here.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Remove no_smp config settings.  We can add them in later after more
testing.

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
index 9d579e41..24b53cf7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
index 9d579e41..24b53cf7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config
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
index 9d579e41..43089dc8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
index 9d579e41..43089dc8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
@@ -1,2 +1,2 @@
 use-kernel-config=multi_v7_defconfig
-config-fragment=
+config-fragment=kernel/configs/ti_multi_v7_prune.config kernel/configs/ti_rt.config
-- 
2.17.1


