Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC47CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 15:12:02 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.445.1759158717286360389
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Sep 2025 08:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A3uo6CpT;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58TFBu6e2703214;
	Mon, 29 Sep 2025 10:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759158716;
	bh=FEBqSNIz5JgqJ6WMvXh7QeHPwPUYgeX/uHvsIbCP1ig=;
	h=From:To:CC:Subject:Date;
	b=A3uo6CpTfvkJBfGUcBd0kYeZ3Evrk01C4rvTde1FHjp80d0LWIYehmLFH8+CzNV6s
	 QDNSiIsx5NS57q4mGV/Zv24nbZR3sHK19CbitaIF8s8rherzEiGNpjhlfbZ8CPnAI3
	 EF7OafWvoTTX6UMuBZ9U4leUCLtFO+MSY2vJvWoM=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58TFBu8h3214415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Sep 2025 10:11:56 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Sep
 2025 10:11:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Sep 2025 10:11:55 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58TFBtVb1684390;
	Mon, 29 Sep 2025 10:11:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] meta-beagle: beagley-ai: Set forward looking UBOOT_MACHINE default
Date: Mon, 29 Sep 2025 10:11:54 -0500
Message-ID: <20250929151154.3552026-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Sep 2025 15:12:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19074

U-Boot bb.org-v6.12, Mainline, Next, and all future releases will have
am67a_beagley_ai_r5_defconfig. Only the three listed versions in this
patch need to use the old defconfig. Set the default so that we do not
need to set this for future versions.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/conf/machine/beagley-ai-k3r5.conf | 6 ++++--
 meta-beagle/conf/machine/beagley-ai.conf      | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
index 07198f2e..c00c14d1 100644
--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
@@ -9,5 +9,7 @@ SYSFW_SOC = "j722s"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
-UBOOT_MACHINE = "j722s_evm_r5_defconfig"
-UBOOT_MACHINE:bsp-bb_org-6_12 = "am67a_beagley_ai_r5_defconfig"
+UBOOT_MACHINE = "am67a_beagley_ai_r5_defconfig"
+UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_r5_defconfig"
+UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_r5_defconfig"
+UBOOT_MACHINE:bsp-ti-6_12 = "j722s_evm_r5_defconfig"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
index 8fbf3cea..d73d0506 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -5,9 +5,10 @@
 require conf/machine/include/j722s.inc
 require conf/machine/include/beagle-bsp.inc
 
-UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_a53_config"
-
 UBOOT_MACHINE = "am67a_beagley_ai_a53_defconfig"
+UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_a53_config"
+UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_a53_config"
+UBOOT_MACHINE:bsp-ti-6_12 = "j722s_evm_a53_config"
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am67a \
-- 
2.39.2


