Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C843C43219
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 09:18:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.5273.1665479930033609611
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 02:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JTzrHguO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29B9Inm7064511
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665479929;
	bh=uSiF+LEmr8WS1lb199SvyoplMU9m/YoUom+WoY7imzk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JTzrHguOXCbIYFH0TejYhBgT6yrlDokfFcbtSPcSRw0WXTV1nF65CMjvkpJ4O+jvA
	 z6wIincEWwclxbwu7FSAtxxeOhNIiLOc62cu7v+0qAHiANxxzSu4IQNV6nqnrycs8B
	 DXzsKzk3JIMmn6MsMGQk31ItB8W8IDwSkM6fXTNc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29B9IndV004073
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:49 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 04:18:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 04:18:49 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29B9IdG8015392;
	Tue, 11 Oct 2022 04:18:47 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH 4/6] ti-graphics: Add j784s4-hs-evm as a
 compatible machine
Date: Tue, 11 Oct 2022 14:48:37 +0530
Message-ID: <20221011091839.1337077-5-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011091839.1337077-1-m-chawdhry@ti.com>
References: <20221011091839.1337077-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 09:18:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15142

Add HS platform to the list of compatible machines.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb       | 4 +++-
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb  | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 1127c5d1..308984fe 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|am62xx"
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62xx"
 
 DEPENDS = "virtual/kernel"
 
@@ -33,12 +33,14 @@ TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
 TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
 TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
 TARGET_PRODUCT_j784s4-evm = "j784s4_linux"
+TARGET_PRODUCT_j784s4-hs-evm = "j784s4_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
 TARGET_BVNC_j7-evm = "22.104.208.318"
 TARGET_BVNC_j7-hs-evm = "22.104.208.318"
 TARGET_BVNC_j721s2-evm = "36.53.104.796"
 TARGET_BVNC_j721s2-hs-evm = "36.53.104.796"
 TARGET_BVNC_j784s4-evm = "36.53.104.796"
+TARGET_BVNC_j784s4-hs-evm = "36.53.104.796"
 TARGET_BVNC_am62xx = "33.15.11.3"
 PVR_BUILD = "release"
 PVR_WS = "wayland"
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index b6bb4324..024aca67 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|am62xx"
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62xx"
 
 PR = "r2"
 
@@ -22,6 +22,7 @@ TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
 TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
 TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
 TARGET_PRODUCT_j784s4-evm = "j784s4_linux"
+TARGET_PRODUCT_j784s4-hs-evm = "j784s4_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
 PVR_BUILD ?= "release"
 PVR_WS = "wayland"
-- 
2.34.1


