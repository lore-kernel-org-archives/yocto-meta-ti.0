Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E8ECDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 00:30:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.197104.1697502602796044349
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 17:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=es8B+B0O;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39H0U0p6092327;
	Mon, 16 Oct 2023 19:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697502601;
	bh=6sSTFgCaVZwwCwb7RCqBCWr5ZyQfde8TCUlKvQ1LyF0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=es8B+B0OuMd8jNhUFUqjZpyXCv7cMldUoQOeg1lBdtx/sfU1+gNq0z/rbApq73hua
	 4fBOVpv5W8vAesSUAgKry6ngSOhql9kBcQXIZnUeupZ+D76YBoYY86jfGAFWoAlW6S
	 gQRn4LzVnPS+Y89I92k3pj57cRDXtEGvq2i5Ipyg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39H0U0Aq029968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Oct 2023 19:30:00 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 19:30:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 19:30:00 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39H0U0sa041124;
	Mon, 16 Oct 2023 19:30:00 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <khasim@ti.com>,
        Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv2 3/3] machine: include: enable sgx on tested platforms
Date: Mon, 16 Oct 2023 19:29:58 -0500
Message-ID: <20231017002958.1762487-4-rs@ti.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017002958.1762487-1-rs@ti.com>
References: <20231017002958.1762487-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 00:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17124

From: Randolph Sapp <rs@ti.com>

Enable SGX Graphics on the currently tested platforms.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 405d82ad..2c427b88 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append = ":am65xx"
 MACHINE_FEATURES += "screen touchscreen gpu"
 
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
 
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index c9d16f3c..c1eb659b 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -13,7 +13,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index ad19798d..567cf128 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index ea5d1505..c70a8363 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
-- 
2.42.0


