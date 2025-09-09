Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107D2CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 15:10:41 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.836.1757430631052737821
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 08:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=O/jrFg2h;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589FASp2312747;
	Tue, 9 Sep 2025 10:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757430628;
	bh=p5FXTTwvnEBwLwS5LOIylIy92Jbif3cMq3BrSHY8G1M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O/jrFg2h2v0WD9FIvOvlSoXOZxOs0+PcLMa9DdpY6n/xjigc/tA2Bu7O0i7zHujH1
	 I7NHZlBrXpmBbj7U6R1LrG01jVeysT6RVv75EPlllV8pPinpgMTzCW+P1ml1oI+a2A
	 BMQiC71zQ9ErJpyf3zqN1nKP0AGaffoLWqj5AMtQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589FASmi446031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 10:10:28 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 10:10:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 10:10:28 -0500
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [10.247.30.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589FASUj2825029;
	Tue, 9 Sep 2025 10:10:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][RFC 4/6] mesa-pvr: Remove need for PVR/SGX display aliases
Date: Tue, 9 Sep 2025 10:10:26 -0500
Message-ID: <20250909151028.272925-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250909151028.272925-1-afd@ti.com>
References: <20250909151028.272925-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Sep 2025 15:10:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18986

Update mesa-pvr which includes a default set of display controller
aliases for the supported display controllers. This means we do not
have to manually set the alias for each device here in the integration
layer. Remove that here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc        | 1 -
 meta-ti-bsp/conf/machine/include/ti33x.inc           | 1 -
 meta-ti-bsp/conf/machine/include/ti43x.inc           | 1 -
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb | 7 +------
 4 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index 2179476f..9058b461 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -9,7 +9,6 @@ require conf/machine/include/ti-bsp.inc
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
-PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
 KERNEL_IMAGETYPES = "zImage uImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index c47165e4..5d7375e5 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -9,7 +9,6 @@ require conf/machine/include/ti-bsp.inc
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
-PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
 
 KERNEL_IMAGETYPE = "zImage"
 
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index a23b6518..7dd5b1f2 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -9,7 +9,6 @@ require conf/machine/include/ti-bsp.inc
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
-PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
 
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index e6bd5fde..6a4b296f 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -28,14 +28,9 @@ PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
 "
 
-SRCREV = "82e6a9293c476267417c5b6b906b01fb73a34e38"
+SRCREV = "68af6a102c2298569e77d1aa8bccc1ff61438b3e"
 PV = "24.0.1"
 
-PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
-PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
-- 
2.39.2


