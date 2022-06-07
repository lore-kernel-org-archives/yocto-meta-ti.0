Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B75ECCA47F
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 10:35:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.11100.1654598137543091075
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 03:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BdgoDBik;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 257AZbmK128292
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654598137;
	bh=oaGE3l7vU3zBLoNKS1bJ4a88HvuzZdoqWYxqcVoj1K8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BdgoDBikDmkntNCTlNm8X5RUej7qTbriLm8EQ3/Kx4qDE285iDRRafgo+duOU1Dty
	 FvH5KtkyfTJ187/hU8jtS9MHAj7/ONreaWWsoZo2jTP8pbdLafr6oPvn2SBHOnYsRd
	 ZkX49Y4OpjhhUVBSJUF0xyvE+ECAM4wHlwETbdWQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 257AZa02017345
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:36 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 05:35:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 05:35:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 257AZZvX033861;
	Tue, 7 Jun 2022 05:35:36 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti] [dunfell PATCH v2 4/5] ti-graphics: Add j721s2-hs-evm as a
 compatible machine
Date: Tue, 7 Jun 2022 16:05:28 +0530
Message-ID: <20220607103529.13068-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220607103529.13068-1-j-choudhary@ti.com>
References: <20220607103529.13068-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Jun 2022 10:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14790

Add HS platform to the list of compatible machines.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb       | 4 +++-
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb  | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 718c7845..3a20d809 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
 
 DEPENDS = "virtual/kernel"
 
@@ -31,10 +31,12 @@ SRCREV = "6d3d62a15ceb85b719c35f34c6c9e35f556b406b"
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
 TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
+TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
 TARGET_BVNC_j7-evm = "22.104.208.318"
 TARGET_BVNC_j7-hs-evm = "22.104.208.318"
 TARGET_BVNC_j721s2-evm = "36.53.104.796"
+TARGET_BVNC_j721s2-hs-evm = "36.53.104.796"
 TARGET_BVNC_am62xx = "33.15.11.3"
 PVR_BUILD = "release"
 PVR_WS = "wayland"
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index 1bfb2b93..7921d17b 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
 
 PR = "r2"
 
@@ -20,6 +20,7 @@ SRCREV = "fba0c770b712640ab3761dbe8369d43f89f616ed"
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
 TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
+TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
 PVR_BUILD ?= "release"
 PVR_WS = "wayland"
-- 
2.17.1


