Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1145ECAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:54:58 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.9612.1759413297408438864
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qTFedXeo;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592DsuAU3296993;
	Thu, 2 Oct 2025 08:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759413296;
	bh=nC6lZXAiL06UbkOiz8ufwOO+ZK2ddl3OQZ/BIElWUdA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qTFedXeoXTKc2ahfxONgoWE/9lT5rWq/y6XFhnF1AIFvJ1gXKqLX7ohT7bw7fWgPh
	 rS8czZAeKX5JyNfjhAZ8DVbYDmlvDEMh7NJ7HacNZF6izntfsUEH1h9xDrgSfBrprE
	 r9BH7osOx+jeKScgJyeSSVpzxR0PYTZ295ynFz5k=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592Dsur41273497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 08:54:56 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 08:54:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:54:55 -0500
Received: from localhost.localdomain ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592Dsst12179255;
	Thu, 2 Oct 2025 08:54:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 4/4] meta-ti-extras: dsptop: Explicitly allow build for AM57x
Date: Thu, 2 Oct 2025 08:54:53 -0500
Message-ID: <20251002135453.1820662-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251002135453.1820662-1-afd@ti.com>
References: <20251002135453.1820662-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:54:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19097

This recipe builds and runs fine on both DRA7x and AM57x machines.
The COMPATIBLE_MACHINE is set to just DRA7x, but this was okay as AM57x
machines also set themselves as DRA7x family devices. The issue is then
we cannot then differentiate between packages that are actually DRA7x-
only and those that just use that family to mean both machine types. To
fix this when we mean both are allowed use "omap-a15" as done here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb             | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index 262ffc9f..fdb16ec4 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -8,7 +8,7 @@ S:append = "/debugss_module/debugss-mod"
 
 inherit module
 
-COMPATIBLE_MACHINE = "dra7xx"
+COMPATIBLE_MACHINE = "omap-a15"
 
 EXTRA_OEMAKE = "PLATFORM=DRA7xx_PLATFORM KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
index 8d36e76f..c1080468 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
@@ -8,7 +8,7 @@ PR = "${INC_PR}.2"
 
 S:append = "/dsptop"
 
-COMPATIBLE_MACHINE = "dra7xx"
+COMPATIBLE_MACHINE = "omap-a15"
 
 EXTRA_OEMAKE = "release DEVICE=DRA7xx CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
 
diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
index 61d9c7f9..1bcaa0ea 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
@@ -11,7 +11,7 @@ PR = "${INC_PR}.0"
 
 S:append = "/dsptop/ulm"
 
-COMPATIBLE_MACHINE = "dra7xx"
+COMPATIBLE_MACHINE = "omap-a15"
 
 EXTRA_OEMAKE = "release DEVICE=DRA7xx CROSS_COMPILE=${TARGET_PREFIX}"
 
-- 
2.39.2


