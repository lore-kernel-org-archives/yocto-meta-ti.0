Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10CCC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 20:38:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.819.1751056693170046551
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 13:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TODCZLpn;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RKcBn62838623;
	Fri, 27 Jun 2025 15:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751056691;
	bh=i4ksM/mKqguN5MM1ipTi3KlKUQvu4/kq0y5PELtPL7k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TODCZLpnCsR999cxt2eQuez5+qarx/a8P3owUEyuCVFrP9+rXcW3eve+P7T5OavNq
	 la/zf128oeO+h+Xl34E/iW/E/YoMuRavk02nbppMzqKra5yxVoJGygsDkcXXUySgDn
	 MreUVRO6X4+p4HilYislRE/xnqxQxvBLHjAhT1qs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RKcB8K3572050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 15:38:11 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 15:38:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 15:38:11 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RKcANd3409926;
	Fri, 27 Jun 2025 15:38:11 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 2/2] meta-ti-bsp: u-boot: Fix some odd indenting
Date: Fri, 27 Jun 2025 15:38:09 -0500
Message-ID: <20250627203809.583945-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627203809.583945-1-afd@ti.com>
References: <20250627203809.583945-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 20:38:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18719

This file uses both spaces and tabs in different functions which
needs fixed at some point. For now at least make sure they are
consistent within the same function.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index c348c99b..ffe50f65 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -222,19 +222,19 @@ do_deploy:append:k3r5 () {
 }
 
 uboot_deploy_config:append:k3r5 () {
-    for f in ${B}/${config}/tiboot3-*.bin; do
+	for f in ${B}/${config}/tiboot3-*.bin; do
 		if [ -f "$f" ]; then
-            f_base=$(basename $f)
+			f_base=$(basename $f)
 			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
-            ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
+			ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
 		fi
 	done
 
 	for f in ${B}/${config}/sysfw*.itb; do
 		if [ -f "$f" ]; then
-            f_base=$(basename $f)
+			f_base=$(basename $f)
 			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
-            ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
+			ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
 		fi
 	done
 }
-- 
2.39.2


