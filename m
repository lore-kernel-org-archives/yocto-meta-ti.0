Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08777CCD183
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:54:58 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.9269.1759413297083752990
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f/ly0cvF;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592Dst5U3296989;
	Thu, 2 Oct 2025 08:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759413295;
	bh=XI00/20W7PzGgDemsJBEavW+Y3Rujz92wHYEO+GsWio=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f/ly0cvFjmvQhxQvTWmETOYVJTxITvQ/zHi1+f6K/dLXj6AK2j1uAkJ3oECJ6RQLQ
	 ynjrFkj21tayba/E+fYMDHn4nprqcXFvuAdGB7em391/h9+C/hTs5eZEjyAoASPdCl
	 8UODqvKmSEAEEmicO+DVKWvyWHslp1yjY1QaHV1s=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592Dstek062286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 08:54:55 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 08:54:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:54:55 -0500
Received: from localhost.localdomain ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592Dsst02179255;
	Thu, 2 Oct 2025 08:54:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 3/4] meta-ti-extras: gdbc6x: Explicitly allow build for AM57x
Date: Thu, 2 Oct 2025 08:54:52 -0500
Message-ID: <20251002135453.1820662-3-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19096

This recipe builds and runs fine on both DRA7x and AM57x machines.
The COMPATIBLE_MACHINE is set to just DRA7x, but this was okay as AM57x
machines also set themselves as DRA7x family devices. The issue is then
we cannot then differentiate between packages that are actually DRA7x-
only and those that just use that family to mean both machine types. To
fix this when we mean both are allowed use "omap-a15" as done here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb            | 2 +-
 meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb     | 2 +-
 .../recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index b803ac5b..3e6dfbff 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=bf0fe2872eb3dfeebb2cbe38206fe81f
 
 DEPENDS = "ncurses bison-native texinfo flex-native gettext"
 
-COMPATIBLE_MACHINE = "dra7xx"
+COMPATIBLE_MACHINE = "omap-a15"
 
 PR = "${INC_PR}.1"
 
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
index c73fb031..a2d8da75 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -8,7 +8,7 @@ PR = "${INC_PR}.0"
 
 S:append = "/gdbserver-c6x/src"
 
-COMPATIBLE_MACHINE = "dra7xx"
+COMPATIBLE_MACHINE = "omap-a15"
 
 EXTRA_OEMAKE = "PLATFORM=DRA7xx_PLATFORM"
 
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index fcca0bbe..1e4fd6c5 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -13,7 +13,7 @@ S:append = "/kernel_module/gdbproxy-mod"
 
 inherit module
 
-COMPATIBLE_MACHINE = "dra7xx"
+COMPATIBLE_MACHINE = "omap-a15"
 
 EXTRA_OEMAKE = "PLATFORM=DRA7xx_PLATFORM KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
-- 
2.39.2


