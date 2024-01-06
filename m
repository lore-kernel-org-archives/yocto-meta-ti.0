Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC1DC47077
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 04:13:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.42722.1704514421669634691
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 20:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=axbq//fz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4064Df9s000391
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:13:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704514421;
	bh=+cmGRYYgxz+bjuUKZPu0pQyk0uJ4WHOt+wSsoHoijzI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=axbq//fzP08j2zkKdiG8Rt5+ztc3Npu+uh7ZSCYI64C9mODiJR6XfB9O81m4cbvSr
	 USUsPwNCl7z1uqzSZHQcIqxAXeXnn2JIwJrTHHuYAMpN6H5acEvPdBTUktoMnI5p1k
	 pPRCB+NoqJ5rY5iWmtKrb8JNmg/5gqN8Qm0xhH8w=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4064Df93077849
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:13:41 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 22:13:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 22:13:40 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4064DZEf091309;
	Fri, 5 Jan 2024 22:13:39 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][master][PATCH v2 2/3] meta-ti: powervr: Enable building for j722s
Date: Sat, 6 Jan 2024 09:43:32 +0530
Message-ID: <20240106041333.2494307-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106041333.2494307-1-a-limaye@ti.com>
References: <20240106041333.2494307-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 Jan 2024 04:13:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17393

From: Darren Etheridge <detheridge@ti.com>

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb        | 3 ++-
 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb         | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
index e5e7a2cb..c87a1fa7 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
@@ -12,7 +12,7 @@ PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 DEPENDS = "virtual/kernel"
 
@@ -31,6 +31,7 @@ TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
 TARGET_PRODUCT:am62pxx = "am62p_linux"
+TARGET_PRODUCT:j722s = "j722s_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
index 41e53029..7301c471 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
@@ -8,7 +8,7 @@ inherit bin_package
 INHIBIT_DEFAULT_DEPS = ""
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 PR = "r2"
 
@@ -22,6 +22,7 @@ TARGET_PRODUCT:j721s2 = "j721s2_linux"
 TARGET_PRODUCT:j784s4 = "j784s4_linux"
 TARGET_PRODUCT:am62xx = "am62_linux"
 TARGET_PRODUCT:am62pxx = "am62p_linux"
+TARGET_PRODUCT:j722s = "j722s_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
-- 
2.34.1


