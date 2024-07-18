Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C728C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 07:56:59 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.10223.1721289416484885341
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 00:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lqZ646B6;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46I7utZs028390
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 02:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721289416;
	bh=6/0bSSEXXRQbcDcIK7+3Kuj5S0wYP9AVjDr8N629E4o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lqZ646B6np4wb2k4+V5J4iIFpPD5cCzsIhEN9ERt9yXHMeYF+HKVk1vbhsX9NdJY3
	 /KTbah8NYl1UVb7alBC+wMG7JA988EclSKOeURG7qP30vUWOizfbLdgURT4w6ZRzoU
	 p/Nox/Upk9O1QeyLXK1mg3r3CR57YuyoG4wxcqQc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46I7utJD030815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 02:56:55 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 02:56:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 02:56:55 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46I7tY0O086409;
	Thu, 18 Jul 2024 02:56:53 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>, <n-francis@ti.com>,
        <u-kumar1@ti.com>, <detheridge@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 2/3] meta-ti-bsp: powervr: Enable building for j742s2
Date: Thu, 18 Jul 2024 13:25:27 +0530
Message-ID: <20240718075526.1427615-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718075526.1427615-1-a-limaye@ti.com>
References: <20240718075526.1427615-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 07:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17884

j742s2 has the same GPU as j784s4. Add j742s2 support to the recipes.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb        | 3 ++-
 .../powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb         | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
index 9d854da9..9007872f 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
@@ -9,7 +9,7 @@ PROVIDES = "virtual/gpudriver"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
 
 DEPENDS = "virtual/kernel"
 
@@ -24,6 +24,7 @@ SRCREV = "707bb373902babf9ced5fd2f99139209ca0f605a"
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
+TARGET_PRODUCT:j742s2 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
 TARGET_PRODUCT:am62pxx = "am62p_linux"
 TARGET_PRODUCT:j722s = "j722s_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
index 57475cb4..e2bf4799 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
@@ -8,7 +8,7 @@ inherit bin_package
 INHIBIT_DEFAULT_DEPS = ""
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
 
 PR = "r3"
 
@@ -20,6 +20,7 @@ S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
+TARGET_PRODUCT:j742s2 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
 TARGET_PRODUCT:am62pxx = "am62p_linux"
 TARGET_PRODUCT:j722s = "j722s_linux"
-- 
2.34.1


