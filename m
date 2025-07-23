Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13297C83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 13:50:57 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.15426.1753278654649303400
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 06:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fV+FE1al;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56NDoqNj1279582;
	Wed, 23 Jul 2025 08:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753278653;
	bh=6688F+1+qTJ6v7ET5xvdf0EmD/Tis20U9Hg1RX54QSk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fV+FE1alYtgP6dZE7OSvXuBJ4qVz82/M9mVCUoNiHkqyMlVjxrWySaKqngbNBI8cJ
	 OcHBMsGKo5X9ga+7a5PlKmP43mgSkoJ2Sepy12GFeyXh9JF8SUdr1a6UTqFWtCjUxC
	 Bbb8SkwX/e4CDbp3hKjKrPF1h/CyrbgJY/2tXvg8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56NDoqI9757550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 23 Jul 2025 08:50:52 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 23
 Jul 2025 08:50:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 23 Jul 2025 08:50:52 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56NDoqoX2782468;
	Wed, 23 Jul 2025 08:50:52 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ueZrw-0005yQ-EF; Wed, 23 Jul 2025 08:50:52 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 2/2] ti-kernel-devicetree-prefix: use shared kernel sources for prefix match
Date: Wed, 23 Jul 2025 08:50:52 -0500
Message-ID: <20250723135052.22396-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250723135052.22396-1-reatmon@ti.com>
References: <20250723135052.22396-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 13:50:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18811

From: Denys Dmytriyenko <denys@konsulko.com>

Handle devicetree prefix matching inside the shared kernel sources
tree, instead of ${S}. From the kernel recipe perspective, ${S} is
just a symlink to the shared kernel sources. But since the new FIT
image wrapper is a separate recipe now, it has its own different
${S}. To enable FIT image wrapper to support devicetree prefix
matching, it also needs to access the same shared kernel sources.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v1: Backport from master patch.

 .../recipes-kernel/linux/ti-kernel-devicetree-prefix.inc    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
index 04c91004..2d7be280 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
@@ -1,4 +1,3 @@
-
 def get_dtbs_from_kernel(dts_dir, dts_prefix):
     import os
     import glob
@@ -36,7 +35,6 @@ def get_merge_dtbs_from_kernel(dts_dir, dts_pattern):
 KERNEL_DEVICETREE_DTBMERGE ?= ""
 
 KERNEL_DEVICETREE = " \
-    ${@get_dtbs_from_kernel('${S}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')} \
-    ${@get_merge_dtbs_from_kernel('${S}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_DTBMERGE}')} \
+    ${@get_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')} \
+    ${@get_merge_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_DTBMERGE}')} \
 "
-
-- 
2.17.1


