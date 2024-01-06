Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C9DC47074
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 04:05:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.42623.1704513923728534092
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 20:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yRhgP7yf;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40645NbO052508
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:05:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704513923;
	bh=fBWmujJ4lwO2CQDuHvuFNbAYb8SqLUOU0TxlcyPl/Do=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yRhgP7yfgBviIZIbqb7fevGDis38S4Z2r2ojhKRpDJt7iquY7WmGF6FAim5fdZwB6
	 LnB8nDILMUNvQ/IiV1f3wqgw8BE5E3zGtIJZxhkI2G5UP9Q2qgNB4G5NyRaB+Y3Hr2
	 g5twZWZyTgUSLKufMsf2ZhCLwWU4robdWgDsSIRM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40645NdE018811
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:05:23 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 22:05:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 22:05:22 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40645HFo064807;
	Fri, 5 Jan 2024 22:05:21 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH v2 2/3] meta-ti: powervr: Enable building for j722s
Date: Sat, 6 Jan 2024 09:35:11 +0530
Message-ID: <20240106040512.2493439-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106040512.2493439-1-a-limaye@ti.com>
References: <20240106040512.2493439-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 Jan 2024 04:05:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17389

From: Darren Etheridge <detheridge@ti.com>

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb        | 3 ++-
 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb         | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
index 3b5d51ec..9cc44673 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
@@ -12,7 +12,7 @@ PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 DEPENDS = "virtual/kernel"
 
@@ -29,6 +29,7 @@ TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
 TARGET_PRODUCT:am62pxx = "am62p_linux"
+TARGET_PRODUCT:j722s = "j722s_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
index 58cd6c37..5a5abdc2 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de52
 inherit bin_package
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 PR = "r2"
 
@@ -20,6 +20,7 @@ TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
 TARGET_PRODUCT:am62pxx = "am62p_linux"
+TARGET_PRODUCT:j722s = "j722s_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
-- 
2.34.1


