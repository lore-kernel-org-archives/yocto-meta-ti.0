Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00CACAC5A0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:28:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.14121.1758202126913660613
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A2PtY0ht;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IDSjHO490975;
	Thu, 18 Sep 2025 08:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758202125;
	bh=R3JQkNJ/JRyHOiHYwoFL85d51x+yECi1CFvIOph2xzI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A2PtY0htuUFGbmES3/2vmMF+t9sn6nLIAOZIUY5ZVgSyhFrigMCV3Ro6NdrqRyI+l
	 6olK+jA+3BGUw/lwnn4RS0nnQdcXW+5rBCNEmPsdtaTd+F4Jb9cbnnqnCdz3M1CDap
	 1WQVyQ5FSWYrhtJvqcljZ31uj4aX1cy9q2+Ynj5s=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IDSjcB2381532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 08:28:45 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 08:28:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 08:28:44 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IDShh8651606;
	Thu, 18 Sep 2025 08:28:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 5/5] mesa-pvr: Use PREFERRED_PROVIDER directly for GPU selection
Date: Thu, 18 Sep 2025 08:28:42 -0500
Message-ID: <20250918132842.1183883-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250918132842.1183883-1-afd@ti.com>
References: <20250918132842.1183883-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:28:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19035

Now that display controller aliases are not set using PACKAGECONFIG,
instead of using PREFERRED_PROVIDER to add either "sgx" or "pvr" to
PACKAGECONFIG, followed by reading it back out, simply use
PREFERRED_PROVIDER directly.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 01426680..992c6b2d 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -21,20 +21,15 @@ SRC_URI = " \
     file://0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch \
 "
 
-PACKAGECONFIG:append = " \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
-"
-
 SRCREV = "68af6a102c2298569e77d1aa8bccc1ff61438b3e"
 PV = "24.0.1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
 
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
 
 do_install:append () {
     # remove pvr custom pkgconfig
-- 
2.39.2


