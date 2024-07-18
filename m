Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5C8C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 18:24:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1359.1721327063628646330
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 11:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CQPV8mfC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46IIOM0i086381;
	Thu, 18 Jul 2024 13:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721327062;
	bh=qJhrkpIIJdhboTqCzskUXlJIy5nLVEXD+/1NE97Ce3w=;
	h=From:To:Subject:Date;
	b=CQPV8mfCiHqXWTJAmg75njlz49qNdtUSsOrlnYB+V7vWcwfgchZdqdMx/U4h0Qx33
	 CPlddLsSTgiKHX5rNgd3AleetjcRRTQjBuTpamkoAP6iYmsY89perthd9p28aMrNLe
	 SMiCQ7M+V2Gaj53F8FOgDEmp9rZxXDO6r8DOonCw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46IIOM4P021970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Jul 2024 13:24:22 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 13:24:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 13:24:22 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46IIOM8o036477;
	Thu, 18 Jul 2024 13:24:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sUVni-0003Xu-1E; Thu, 18 Jul 2024 13:24:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] linux: Manage the kernel patches using the BSP system
Date: Thu, 18 Jul 2024 13:24:21 -0500
Message-ID: <20240718182421.13591-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 18:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17888

Applying the patches to all kernels is not going to work.  Each kernel
might need different patches to address reproducibility issues.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index f24fbe51..8bb30d40 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -13,8 +13,12 @@ EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
 KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
 KERNEL_DTBVENDORED = "1"
 
-SRC_URI:append = " \
-file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
-file://0001-vt-conmakehash-improve-reproducibility.patch \
-file://0001-pnmtologo-use-relocatable-file-name.patch \
+KERNEL_PATCHES = ""
+
+KERNEL_PATCHES:bsp-ti-6.6 = " \
+    file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
+    file://0001-vt-conmakehash-improve-reproducibility.patch \
+    file://0001-pnmtologo-use-relocatable-file-name.patch \
 "
+
+SRC_URI:append = " ${KERNEL_PATCHES} "
-- 
2.17.1


