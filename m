Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF09AC001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 15:12:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9933.1690470740744339493
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 08:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gK9WzXPA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36RFCGOO039651;
	Thu, 27 Jul 2023 10:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690470736;
	bh=N/CIAROgo2S0grthMV2MiX2JpGQ4obMErjl+woBdKtE=;
	h=From:To:Subject:Date;
	b=gK9WzXPAy1eyfG8UPGTrbcwT60V4ZMl1nQczOzx7gS6Xpm4WoeGzwAS7D6z2gcDyl
	 YVC2tlKXDGU37qf1J7+2T3QlaDYpl19I02WDx3zvDWRSWMRhyNlIpOo96+tN9xNh0o
	 QNqNs45pjE3wtPAYiOy75IuuGUdDKepWdn6KXKeI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36RFCGJq023391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jul 2023 10:12:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jul 2023 10:12:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jul 2023 10:12:16 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36RFCGJu056301;
	Thu, 27 Jul 2023 10:12:16 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qP2f2-00063J-A4; Thu, 27 Jul 2023 10:12:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v2 1/2]  ti-kernel-devicetree-prefix: Add search function for DTBMERGE
Date: Thu, 27 Jul 2023 10:12:15 -0500
Message-ID: <20230727151216.23224-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Jul 2023 15:12:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16864

With the change to the vendored arch/arm/boot/dts directory, we need to
add support to the KERNEL_DEVICETREE_DTBMERGE to make it a search
pattern instead of a fixed list.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../linux/ti-kernel-devicetree-prefix.inc     | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
index 1496a749..04c91004 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
@@ -18,5 +18,25 @@ def get_dtbs_from_kernel(dts_dir, dts_prefix):
             matches.append(filename)
     return ' '.join(matches)
 
-KERNEL_DEVICETREE = "${@get_dtbs_from_kernel('${S}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')} ${KERNEL_DEVICETREE_DTBMERGE}"
+def get_merge_dtbs_from_kernel(dts_dir, dts_pattern):
+    import os
+    matches = []
+    if dts_dir == "":
+        return ' '
+    for pattern in dts_pattern.split():
+        pattern_dir = os.path.split(pattern)[0]
+        pattern_target = os.path.split(pattern)[1].replace(".","-") + "s"
+        makefile = dts_dir + "/" + pattern_dir + "/Makefile"
+        if os.path.exists(makefile):
+            with open(makefile) as f:
+                if pattern_target in f.read():
+                    matches.append(pattern)
+    return ' '.join(matches)
+
+KERNEL_DEVICETREE_DTBMERGE ?= ""
+
+KERNEL_DEVICETREE = " \
+    ${@get_dtbs_from_kernel('${S}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')} \
+    ${@get_merge_dtbs_from_kernel('${S}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_DTBMERGE}')} \
+"
 
-- 
2.17.1


