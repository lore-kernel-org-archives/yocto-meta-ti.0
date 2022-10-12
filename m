Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B20C43219
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 10:09:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.18397.1665569393081620899
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 03:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wT5ROLSz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29CA9qDI124795
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 05:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665569392;
	bh=uSiF+LEmr8WS1lb199SvyoplMU9m/YoUom+WoY7imzk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wT5ROLSzkhBcQFQlrLn75hxhicT0OTKh+hZvkmTaNiDcujDYnVKA+5dT4wKcSNZ7h
	 Q1BW6LgTJTu3vQbZmUTDZWuCc+ISkvwq+tG+w3oBt6Afu7GP+pxuM2oUKzRm/tP4tY
	 4qeBcahelgG8yPbnSCyLZFNvxu3wfwIuczIXH6Uo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29CA9qdb066007
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 05:09:52 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 12
 Oct 2022 05:09:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 12 Oct 2022 05:09:51 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29CA9fCN014602;
	Wed, 12 Oct 2022 05:09:50 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH v2 4/6] ti-graphics: Add j784s4-hs-evm as a compatible machine
Date: Wed, 12 Oct 2022 15:39:39 +0530
Message-ID: <20221012100941.153924-5-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221012100941.153924-1-m-chawdhry@ti.com>
References: <20221012100941.153924-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 10:09:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15153

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


