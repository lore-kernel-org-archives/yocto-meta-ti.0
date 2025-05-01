Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF97CC369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 14:26:32 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.5.1746109586633462805
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 May 2025 07:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L6+br7IF;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 541EQPJH3632429
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 09:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746109585;
	bh=MiNbT9BifPUXVLGhGgrgHV17vKu+Ysa+1QfEJtjibyE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L6+br7IFwbeq+nvVTC/oReHm02WyVCVwS/OCPwVLI9RotsGdN1GUGmrIvc1ANFRoD
	 QrIZr+2EvcGEuRiAy5tQJuP+yJiR0k5M6bgKOxxGIxmrCaXutGwchKAxSq4u4mgYEJ
	 7S1nmycI1Y5L238UKAy7A+SZ1VMBn+PU9iXWDrc0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 541EQPcf102934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 09:26:25 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 09:26:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 09:26:24 -0500
Received: from fllvsmtp8.itg.ti.com ([10.250.35.60])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 541EQO6j077683;
	Thu, 1 May 2025 09:26:24 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 2/3] ti-linux-fw: Set INHIBIT_DEFAULT_DEPS
Date: Thu, 1 May 2025 09:26:22 -0500
Message-ID: <20250501142623.351217-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250501142623.351217-1-afd@ti.com>
References: <20250501142623.351217-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 May 2025 14:26:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18524

Firmware here are not built, no need for C compiler nor std libs.
Add INHIBIT_DEFAULT_DEPS=1 and remove the same from all recipes
that include this file.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb           | 2 --
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb         | 2 --
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc    | 3 +++
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 --
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 638138f4..d6dbd402 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -7,8 +7,6 @@ COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-INHIBIT_DEFAULT_DEPS = "1"
-
 inherit deploy
 inherit update-alternatives
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index e4b6d1de..8037ac6c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -7,8 +7,6 @@ COMPATIBLE_MACHINE = "j721e|j7200|j784s4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-INHIBIT_DEFAULT_DEPS = "1"
-
 inherit update-alternatives
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 2aa07f71..0426e803 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -43,6 +43,9 @@ INHIBIT_SYSROOT_STRIP = "1"
 # This is used to prevent the build system from splitting out the firmware debug info into a separate file
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
+# Firmware here are prebuilt with no external dependencies
+INHIBIT_DEFAULT_DEPS = "1"
+
 # Disable arch checking as firmware is likely to be a different arch from the Yocto build
 INSANE_SKIP:${PN} += "arch"
 
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 00112017..15c48e6f 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -7,8 +7,6 @@ COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-INHIBIT_DEFAULT_DEPS = "1"
-
 inherit update-alternatives
 
 PLAT_SFX = ""
-- 
2.39.2


