Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69027C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 14:32:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.11332.1651156354969126596
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 07:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e9g1P3AH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SEWXkE112247;
	Thu, 28 Apr 2022 09:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651156353;
	bh=fczGk06fOoZYxV0hs5pnfwaaj2b1oVdkuJJmoI5IzlU=;
	h=From:To:CC:Subject:Date;
	b=e9g1P3AHc/ITTEb6Ic8HVluvPSIM4tiAifa68sbpUAXu2+NACHMxhMp51GCVPbCfX
	 tMVwbTX3CvnYqV2HX+8LlTdCOE/9P1SAPmpAFKvn+vKOMvwz24p6VZhpdehfD3gb8Q
	 tR/O6zzKFmxM/4l03hUssbZR8HoVKuWGDn6u9lFc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SEWWSA079984
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 09:32:33 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 09:32:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 09:32:32 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SEWVIu012934;
	Thu, 28 Apr 2022 09:32:32 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH] ION is superseded now by DMA-BUF Heaps
 remove libion
Date: Thu, 28 Apr 2022 09:32:31 -0500
Message-ID: <20220428143231.16564-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 14:32:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14634

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-devtools/ion/libion_git.bb | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-devtools/ion/libion_git.bb

diff --git a/meta-ti-bsp/recipes-devtools/ion/libion_git.bb b/meta-ti-bsp/recipes-devtools/ion/libion_git.bb
deleted file mode 100644
index f5ca8e82..00000000
--- a/meta-ti-bsp/recipes-devtools/ion/libion_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "ION Userspace Memory Allocator Library"
-HOMEPAGE = "https://github.com/glneo/libion"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-
-PV = "1.0.0"
-
-BRANCH = "master"
-SRC_URI = "git://github.com/glneo/libion.git;protocol=https;branch=${BRANCH}"
-SRCREV = "7e138fc31febbb67734792c1a911439bfd6d23eb"
-
-S = "${WORKDIR}/git"
-
-inherit cmake pkgconfig
-- 
2.17.1


