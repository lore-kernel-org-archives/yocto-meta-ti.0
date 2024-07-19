Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3A3C3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 15:10:26 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.20766.1721401820850614329
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 08:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sV0sY3Y4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46JFAJW1012738;
	Fri, 19 Jul 2024 10:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721401819;
	bh=eATdgBVP56Wky3pvbtdOxkJkBEDKqfued+Lny77qzY4=;
	h=From:To:Subject:Date;
	b=sV0sY3Y4/pgd+cP6AbHZlutRgrgbJF2aEBIFs0Cv1ZAy8mUBVZQcYZrrABkOeaclI
	 w8R8q9WJPCmqYgoqacxt+NYqQ/3fJVARAHQZQFXtkkKgNzeZQyscQJEpOsAyrVgvBu
	 aUg/FlrDiduHS9J+cPI6+irEgDqBKOLtu6ocONG0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46JFAJUl018614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Jul 2024 10:10:19 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jul 2024 10:10:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jul 2024 10:10:18 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46JFAIOt049766;
	Fri, 19 Jul 2024 10:10:18 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sUpFS-0002E8-NZ; Fri, 19 Jul 2024 10:10:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] linux: Manage the kernel patches using the BSP system
Date: Fri, 19 Jul 2024 10:10:18 -0500
Message-ID: <20240719151018.8521-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Jul 2024 15:10:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17892

Applying the patches to all kernels is not going to work.  Each kernel
might need different patches to address reproducibility issues.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix BSP tag for bsp-ti-6_6

 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index f24fbe51..1831ba66 100644
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
+KERNEL_PATCHES:bsp-ti-6_6 = " \
+    file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
+    file://0001-vt-conmakehash-improve-reproducibility.patch \
+    file://0001-pnmtologo-use-relocatable-file-name.patch \
 "
+
+SRC_URI:append = " ${KERNEL_PATCHES} "
-- 
2.17.1


