Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4829C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 20:41:41 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.984.1751056892406146195
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 13:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hcQfuLUT;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RKfVWl2838883;
	Fri, 27 Jun 2025 15:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751056891;
	bh=bpB9d/+7cliIfbbak1aOsQ+DSPnUyUzCIaDIVyGeZFo=;
	h=From:To:CC:Subject:Date;
	b=hcQfuLUT8/6GYXKcIFhZM6TzwXpqwbEu2pnfUTgo00nawW3OQHCAL65FM9kbx8gCH
	 qpHpotLEvOWzuoyD1nT1yRJjltbIkZQgLKkzFJoW817bmW0DYcfy3Ik4CcPym+BpNF
	 mktLr+k087IT4yMVIIrWzBOPJ1CrPD6b7zWZ9PXo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RKfV8r778865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 15:41:31 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 15:41:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 15:41:30 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RKfUit3414064;
	Fri, 27 Jun 2025 15:41:30 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] meta-ti-bsp: linux: Remove extra dtc flags for DT Overlays
Date: Fri, 27 Jun 2025 15:41:29 -0500
Message-ID: <20250627204129.584298-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 20:41:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18721

This hides issues like missing flags that will cause issues for folks who
build or re-build the kernel outside the Yocto environment. It is better
to find these issues and fix them at the source in the Linux makefile,
not mask issues here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-soc.inc    |  1 -
 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 10 ----------
 2 files changed, 11 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
index 5d77e719..ceab2ba7 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -5,4 +5,3 @@ require conf/machine/include/soc-family.inc
 
 # TI platforms all use devicetrees with overlays
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree"
-KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index 8c14446a..40ddc4fd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -1,13 +1,3 @@
-# Add DTC FLAGS -@ when KERNEL_DTB_OVERLAY_SUPPORT is enabled
-
-def get_extra_dtc_args(d):
-    if d.getVar('KERNEL_DTB_OVERLAY_SUPPORT') == "1":
-        return "DTC_FLAGS=-@"
-    else:
-        return ""
-
-EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
-
 # Tell the kernel class to install the DTBs in the same directory structure as
 # the kernel.
 KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
-- 
2.39.2


