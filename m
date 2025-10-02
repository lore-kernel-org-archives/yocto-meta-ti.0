Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B30CCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:54:58 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.9268.1759413296905389683
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VMWe2D/+;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592Dst2A2843174;
	Thu, 2 Oct 2025 08:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759413295;
	bh=jlYnYIijmeeVdTplqBopTP1XarC9kQeIKoAp16/CD44=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VMWe2D/+vJ9u/uaOfktBuryiB5QYRiLWS7AZ5YSMqwmsSLJotTQxq9tS8OkXT42ZF
	 SCh+GwfgtNIVRVPgLtkbzXeWWOSGQV7AH5TUKsSzpAnB04fjS1hLhbNF8a4UiYrcGW
	 zXTgd2zgBmxneLaIEgARjesCqbm/iQwOi64gd6Q0=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DstCV062283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 08:54:55 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 08:54:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:54:55 -0500
Received: from localhost.localdomain ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592Dsssx2179255;
	Thu, 2 Oct 2025 08:54:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 2/4] meta-ti-extras: dsptop: Simplify for DRA7xx only build
Date: Thu, 2 Oct 2025 08:54:51 -0500
Message-ID: <20251002135453.1820662-2-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19095

This recipe is already only compatible with the DRA7xx machine, so
no need to set PLATFORM based on the only possibility. This then
allows us to directly set the compile flags for the same. And now
that the package does not change based on the machine, remove the
PACKAGE_ARCH line.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/dsptop/debugss-module-drv_git.bb          | 8 ++------
 meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb           | 8 ++------
 meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb           | 8 ++------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index d8e759d9..262ffc9f 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -8,13 +8,9 @@ S:append = "/debugss_module/debugss-mod"
 
 inherit module
 
-PLATFORM = ""
-PLATFORM:dra7xx = "DRA7xx_PLATFORM"
-
-EXTRA_OEMAKE = "'PLATFORM=${PLATFORM}' KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
-
 COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+EXTRA_OEMAKE = "PLATFORM=DRA7xx_PLATFORM KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 include dsptop.inc
 
diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
index 5e8c56b8..8d36e76f 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
@@ -8,19 +8,15 @@ PR = "${INC_PR}.2"
 
 S:append = "/dsptop"
 
-DEVICE = ""
-DEVICE:dra7xx = "DRA7xx"
+COMPATIBLE_MACHINE = "dra7xx"
 
-EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
+EXTRA_OEMAKE = "release DEVICE=DRA7xx CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
 
 do_install() {
     oe_runmake install DESTDIR=${D}
     chown -R root:root ${D}
 }
 
-COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 RDEPENDS:${PN} = "debugss-module-drv bash"
 
 include dsptop.inc
diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
index 73c7831e..61d9c7f9 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
@@ -11,10 +11,9 @@ PR = "${INC_PR}.0"
 
 S:append = "/dsptop/ulm"
 
-DEVICE = ""
-DEVICE:dra7xx = "DRA7xx"
+COMPATIBLE_MACHINE = "dra7xx"
 
-EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
+EXTRA_OEMAKE = "release DEVICE=DRA7xx CROSS_COMPILE=${TARGET_PREFIX}"
 
 do_compile() {
     oe_runmake arm XPORT_ONLY CC="${CC}"
@@ -31,9 +30,6 @@ do_install() {
     cp -f release/libtiulm.ae66 ${D}${datadir}/ti/ulm
 }
 
-COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 FILES:${PN}-dev += "\
     ${datadir}/ti/ulm \
 "
-- 
2.39.2


